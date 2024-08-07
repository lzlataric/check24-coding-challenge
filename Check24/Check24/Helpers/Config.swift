//
//  Config.swift
//  Check24
//
//  Created by Luka Zlatarić on 21.06.2024..
//

import Foundation

struct Config {
    struct Network {
        static let url = "https://app.check24.de/products-test.json"
        static let check24URL = "https://m.check24.de/rechtliche-hinweise/?deviceoutput=app"
        
        struct ErrorText {
            static let parsingError = "Failed to parse JSON"
            static let statusCode = "Invalid status code: "
            static let invalidURL = "Invalid URL"
            static let invalidResponse = "Invalid Response"
        }
    }
    
    struct Texts {
        static let footerStaticText = "© 2016 Check24"
        static let all = "All"
        static let available = "Available"
        static let favorites = "Favorites"
        static let price = "Price: "
        static let description = "Description:"
    }
}
