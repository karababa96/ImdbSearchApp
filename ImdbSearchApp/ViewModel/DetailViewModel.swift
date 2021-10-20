//
//  DetailViewModel.swift
//  ImdbSearchApp
//
//  Created by Ali Karababa on 18.10.2021.
//

import Foundation
import SwiftUI


class FilmDetailViewModel: ObservableObject {
    
    @Published var filmDetails : FilmDetailsViewModel?
    
    let downloaderClient = FilmDownloaderClient()
    func downloadFilmDetail(imdbId: String) {
        downloaderClient.downloadDeatils(imdbId: imdbId) { (result) in
            switch result {
            case .failure(let error):
                print("Error was occured: \(error.localizedDescription)")
            case .success(let details):
                DispatchQueue.main.async {
                    self.filmDetails = FilmDetailsViewModel(detail: details!)
                }
                
            }
        }
    }
    
}


struct FilmDetailsViewModel {
    let detail: DetailModel
    
    var title: String {
        detail.title
    }
    var year: String {
        detail.year
    }
    
    var actors: String {
        detail.actors
    }
    
    var writer: String {
        detail.writer
    }
    
    var awards: String {
        detail.awards
    }
    var language: String {
        detail.language
    }
    var imdbRating: String {
        detail.imdbRating
    }
    var metaScore: String {
        detail.metascore
    }
    var genre: String {
        detail.genre
    }
    var imdbId: String {
        detail.imdbId
    }
    var runtime: String {
        detail.runtime
    }
    var plot: String {
        detail.plot
    }
    var poster: String {
        detail.poster
    }
    
}



