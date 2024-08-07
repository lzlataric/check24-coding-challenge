//
//  AvaliableListingView.swift
//  Check24
//
//  Created by Luka Zlatarić on 21.06.2024..
//

import SwiftUI

struct AvaliableListingView: View {
    var product: Product
    var body: some View {
        AsyncImage(url: URL(string: product.imageURL))
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        Spacer()
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(product.name)
                    .font(.system(size: 14).bold())
                Spacer()
                Text(product.releaseDate.toFormattedDateString())
                    .font(.system(size: 14))
            }
            
            Text(product.description)
                .font(.system(size: 12))
                .lineLimit(nil)
            Spacer()
        }
    }
}

//#Preview {
//    AvaliableListingView()
//}
