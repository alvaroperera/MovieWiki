//
//  OpenMovieDBAPI.swift
//  MovieWiki
//
//  Created by Álvaro Perera on 27/1/25.
//

import Foundation

class OpenMovieDBAPIHelper {
    
    static let apiKey: String = "eb0480c2"
    // https://www.omdbapi.com/?s=avatar&apikey=eb0480c2
    static func getMoviesBySearchName(name: String,
                                      baseUrl: String = "https://www.omdbapi.com/?s=",
                                      apiKey: String = apiKey) async throws -> MovieResponse {
        
        let petition = URL(string: "\(baseUrl)\(name)&apikey=\(apiKey)")!
        
        let (data, _) = try await URLSession.shared.data(from: petition)
        
        let result = try JSONDecoder().decode(MovieResponse.self, from: data)
        
        return result.self
    }
}
