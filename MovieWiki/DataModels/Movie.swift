//
//  Movie.swift
//  MovieWiki
//
//  Created by Álvaro Perera on 27/1/25.
//

import Foundation

struct Movie: Codable {
    let title: String
    let year: String
    let porterURL: String
    let plot: String
    let duration: String
    let director: String
    let genre: String
    let country: String
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
