//
//  FilmModel.swift
//  ImdbSearchApp
//
//  Created by Ali Karababa on 14.10.2021.
//

import Foundation



struct FilmModel : Codable {
    
    let title : String
    let year:  String
    let imdbId : String
    let types : String
    let poster : String
    
    init(title: String, year: String, imdbId: String, types: String, poster: String) {
        self.title = title
        self.year = year
        self.imdbId = imdbId
        self.types = types
        self.poster = poster
    }

    private enum CodingKeys : String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case types = "Type"
        case poster = "Poster"
    }
}

struct ReceivedFilmsModel: Codable {
    let films : [FilmModel]
    
    private enum CodingKeys : String, CodingKey {
        case films = "Search"
    }
    
}


