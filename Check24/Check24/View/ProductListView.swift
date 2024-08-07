//
//  ProductListView.swift
//  Check24
//
//  Created by Luka Zlatarić on 21.06.2024..
//

import SwiftUI

struct ProductListView: View {
    @StateObject var productVM = ProductViewModel()
    var body: some View {
        NavigationStack {
            Picker(selection: $productVM.selectedFilterIndex, label: Text("")) {
                Text(Config.Texts.all).tag(0)
                Text(Config.Texts.available).tag(1)
                Text(Config.Texts.favorites).tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 360)
            
            VStack(alignment: .leading) {
                Text(productVM.title)
                    .font(.system(size: 16).bold())
                    .padding(.leading, 20)
                
                Text(productVM.subTitle)
                    .font(.system(size: 16))
                    .padding(.leading, 20)
                
                ScrollView {
                    LazyVStack(spacing: 15) {
                        ForEach(productVM.filteredProducts) { product in
                            NavigationLink(destination: ProductDetailView(productVM: productVM, product: product)) {
                                ProductListingView(product: product, isFavorite: productVM.isProductFavorite(id: String(product.id)))
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        Link(Config.Texts.footerStaticText,
                             destination: URL(string: Config.Network.check24URL)!)
                        .font(.system(size: 12))
                    }
                    .padding(.top, 10)
                    
                }
                .scrollIndicators(.hidden)
                .refreshable {
                    await productVM.refreshProducts()
                }
            }
            .padding(.top, 10)
        }
        Spacer()
    }
}

#Preview {
    ProductListView()
}
