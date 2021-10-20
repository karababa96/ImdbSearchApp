//
//  FilmViewModel.swift
//  ImdbSearchApp
//
//  Created by Ali Karababa on 18.10.2021.
//

import Foundation
import SwiftUI


class FilmListViewModel: ObservableObject {
    
    @Published var films = [FilmViewModel]()
    
    func searchFilm(nameOfFilm: String) {
        ApiCaller().getData(search: nameOfFilm) { (result) in
            switch result {
            case .failure(let error):
                print("Error was occure: \(error.localizedDescription)")
            case .success(let filmArray):
                if let filmArray = filmArray {
                    DispatchQueue.main.async {
                        self.films = filmArray.map( FilmViewModel.init)
                    }
                    
                }
            }
        }
    }
}

struct FilmViewModel {
    let film : FilmModel
    
    
    var title : String {
        film.title
    }
    
    var poster : String {
        film.poster
    }
    
    var year: String {
        film.year
    }
    
    var imdbId: String {
        film.imdbId
    }
}
