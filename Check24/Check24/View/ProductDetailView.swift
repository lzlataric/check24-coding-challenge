//
//  ProductDetailView.swift
//  Check24
//
//  Created by Luka Zlatarić on 21.06.2024..
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var productVM: ProductViewModel
    @State var isFavorite = false
    
    var product: Product
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    AsyncImage(url: URL(string: product.imageURL))
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(product.name)
                            .font(.system(size: 16).bold())
                        
                        Text(Config.Texts.price)
                            .font(.system(size: 14).bold())
                        +
                        Text("\(product.price.value, specifier: "%.2f")\(product.price.currency)")
                            .font(.system(size: 14))
                        
                        Spacer()
                        
                        HStack {
                            HStack(alignment: .lastTextBaseline, spacing: 5) {
                                Text(String(product.rating))
                                    .font(.system(size: 14))
                                    .padding(.top, 5)
                                
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                                    .font(.system(size: 14))
                            }
                            .frame(width: 60)
                            Spacer()
                            
                            Text(product.releaseDate.toFormattedDateString())
                                .font(.system(size: 15))
                        }
                        Spacer()
                    }
                }
                
                Text(product.description)
                    .font(.system(size: 13))
                    .lineLimit(nil)
                    .padding(.top, 20)
                
                Text(Config.Texts.description)
                    .font(.system(size: 14).bold())
                    .padding(.top, 20)
                
                Text(product.longDescription.removingNewlines())
                    .font(.system(size: 12))
                    .lineLimit(nil)
                
            }
            .padding([.trailing, .leading], 10)
            
            Link(Config.Texts.footerStaticText,
                 destination: URL(string: Config.Network.check24URL)!)
            .font(.system(size: 12))
            .padding(.top, 10)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if productVM.isProductFavorite(id: String(product.id)) {
                    Button(action: {
                        UserDefaults.standard.removeObject(forKey: String(product.id))
                        isFavorite.toggle()
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundStyle(.red)
                    }
                } else {
                    Button(action: {
                        UserDefaults.standard.setValue("Favorite", forKey: String(product.id))
                        isFavorite.toggle()
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundStyle(.red)
                    }
                }
                
            }
        }
        .onAppear {
            if productVM.isProductFavorite(id: String(product.id)) {
                isFavorite = true
            } else {
                isFavorite = false
            }
        }
        .onDisappear {
            Task {
                await productVM.refreshProducts()
            }
        }
    }
}

//#Preview {
//    ProductDetailView()
//}
