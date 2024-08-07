//
//  ProductModel.swift
//  Check24
//
//  Created by Luka Zlatarić on 21.06.2024..
//

import Foundation

struct ProductModel: Decodable {
    let header: Header
    let products: [Product]
}

struct Header: Decodable {
    let headerTitle: String
    let headerDescription: String
}

struct Product: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let color: String
    let imageURL: String
    let colorCode: String
    let available: Bool
    let releaseDate: Int
    let description: String
    let longDescription: String
    let rating: Double
    let price: Price
}

struct Price: Decodable {
    let value: Double
    let currency: String
}
