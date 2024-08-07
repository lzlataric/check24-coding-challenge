//
//  PruductService.swift
//  Check24
//
//  Created by Luka Zlatarić on 21.06.2024..
//

import Foundation

class ProductService {
    private let decoder = JSONDecoder()
    
    func getData<T: Decodable>() async throws -> T {
        guard let url = URL(string: Config.Network.url) else {
            throw APIErrors.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse else {
            throw APIErrors.invalidResponse
        }
        if response.statusCode != 200 {
            throw APIErrors.invalidStatusCode(code: String(response.statusCode))
        }
        do {
            return try decoder.decode(T.self, from: data)
        }
        catch {
            throw APIErrors.parsingError
        }
    }
}
