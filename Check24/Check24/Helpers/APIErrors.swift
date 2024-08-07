//
//  APIErrors.swift
//  Check24
//
//  Created by Luka Zlatarić on 21.06.2024..
//

import Foundation

enum APIErrors: Error {
    case parsingError
    case invalidStatusCode(code: String)
    case invalidResponse
    case invalidURL
    
    var customDescription: String {
        switch self {
        case .invalidURL:
            return Config.Network.ErrorText.invalidURL
        case .parsingError:
            return Config.Network.ErrorText.parsingError
        case .invalidResponse:
            return Config.Network.ErrorText.invalidResponse
        case .invalidStatusCode(let statusCode):
            return Config.Network.ErrorText.statusCode + statusCode
        }
    }
}
