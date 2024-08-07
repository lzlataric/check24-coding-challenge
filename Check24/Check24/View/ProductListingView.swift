//
//  ProductListingView.swift
//  Check24
//
//  Created by Luka Zlatarić on 21.06.2024..
//

import SwiftUI

struct ProductListingView: View {
    var product: Product
    var isFavorite: Bool
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                if product.available {
                    AvaliableListingView(product: product)
                } else {
                    NotAvailableListingView(product: product)
                }
            }
            .padding([.leading, .trailing], 10)
            Spacer()
            HStack {
                HStack(alignment: .lastTextBaseline, spacing: 5) {
                    Text(String(product.rating))
                        .font(.system(size: 13))
                        .padding(.top, 5)
                    
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                        .font(.system(size: 13))
                }
                .frame(width: 60)
                
                Spacer()
                
                Text("Price: ")
                    .font(.system(size: 13).bold())
                +
                Text("\(product.price.value, specifier: "%.2f")\(product.price.currency)")
                    .font(.system(size: 13))
            }
            .padding([.leading, .trailing], 10)
            .padding(.bottom, 10)
        }
        .padding(.top, 20)
        .frame(width: 360)
        .background(RoundedRectangle(cornerRadius: 8)
            .fill(.white)
            .shadow(color: isFavorite ? .blue : .gray, radius: 3, x: 0, y: 1)
        )
    }
}
