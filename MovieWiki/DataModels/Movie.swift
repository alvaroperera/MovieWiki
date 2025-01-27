//
//  Movie.swift
//  MovieWiki
//
//  Created by Álvaro Perera on 27/1/25.
//

import Foundation

struct Movie: Decodable {
    let imdbID: String
    let title: String
    let year: String
    let poster: String
    let plot: String?
    let runtime: String?
    let director: String?
    let genre: String?
    let country: String?
    
    private enum CodingKeys: String, CodingKey {
        case imdbID
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
        case plot = "Plot"
        case runtime = "Runtime"
        case director = "Director"
        case genre = "Genre"
        case country = "Country"
    }
}

struct MovieResponse: Decodable {
    let search: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}
