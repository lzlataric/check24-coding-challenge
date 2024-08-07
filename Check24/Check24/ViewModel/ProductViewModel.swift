//
//  ProductViewModel.swift
//  Check24
//
//  Created by Luka Zlatarić on 21.06.2024..
//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
    @Published var filteredProducts = [Product]()
    @Published var products = [Product]()
    @Published var title = ""
    @Published var subTitle = ""
    @Published var selectedFilterIndex = 0
    
    private let service = ProductService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        Task {
            await getProducts()
        }
        
        $selectedFilterIndex
            .sink { [weak self] index in
                guard let self = self else { return }
                switch index {
                case 0:
                    self.filteredProducts = self.products
                case 1:
                    self.filteredProducts = self.products.filter { $0.available == true }
                case 2:
                    self.filteredProducts = self.products.filter { self.isProductFavorite(id: String($0.id)) == true }
                default:
                    print()
                }
            }
            .store(in: &cancellables)
    }
    
    private func getProducts() async {
        do {
            let response: ProductModel = try await service.getData()
            await MainActor.run {
                filteredProducts = response.products
                products = response.products
                title = response.header.headerTitle
                subTitle = response.header.headerDescription
            }
        }
        catch {
            //TODO: Handle error
            print(error)
        }
    }
    
    func refreshProducts() async {
        do {
            let response: ProductModel = try await service.getData()
            await MainActor.run {
                products = response.products
                title = response.header.headerTitle
                subTitle = response.header.headerDescription
                switch selectedFilterIndex {
                case 0:
                    self.filteredProducts = self.products
                case 1:
                    self.filteredProducts = self.products.filter { $0.available == true }
                case 2:
                    self.filteredProducts = self.products.filter { isProductFavorite(id: String($0.id)) == true }
                default:
                    print()
                }
            }
        }
        catch {
            //TODO: Handle error
            print(error)
        }
    }
    
    func isProductFavorite(id: String) -> Bool {
        if UserDefaults.standard.object(forKey: id) != nil {
            return true
        } else {
            return false
        }
    }
}
