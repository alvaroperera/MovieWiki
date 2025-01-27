//
//  Movie.swift
//  MovieWiki
//
//  Created by Álvaro Perera on 27/1/25.
//

import Foundation

struct Movie: Codable {
    let Title: String
    let Year: String
    let Poster: String
    let Plot: String
    let Runtime: String
    let Director: String
    let Genre: String
    let Country: String
}

struct MovieResponse: Codable {
    let Search: [MovieItem]
    let totalResults: String
    let Response: String
}

struct MovieItem: Codable {
    let Title: String
    let Year: String
    let imdbID: String
    let `Type`: String
    let Poster: String
}
