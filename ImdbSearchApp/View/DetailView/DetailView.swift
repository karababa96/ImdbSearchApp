//
//  DetailView.swift
//  ImdbSearchApp
//
//  Created by Ali Karababa on 18.10.2021.
//

import SwiftUI

struct DetailView: View {
    
    let imdbId: String
    
    @ObservedObject var filmDetail = FilmDetailViewModel()
    
    var body: some View {
        VStack {
            SpecialImageView(url: filmDetail.filmDetails?.poster ?? "")
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.3)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Text("Title: \(filmDetail.filmDetails?.title ?? "N/A")")
                    Spacer()
                    Text("Imdb Rating: \(filmDetail.filmDetails?.imdbRating ?? "N/A")")
                    Spacer()
                }
                Divider()
                Text("Actors: \(filmDetail.filmDetails?.actors ?? "N/A")")
                Divider()
                HStack {
                    Spacer()
                    Text("Year: \(filmDetail.filmDetails?.year ?? "N/A")")
                    Spacer()
                    Text("Language: \(filmDetail.filmDetails?.language ?? "N/A")")
                    Spacer()
                }
                Divider()
                HStack {
                    Spacer()
                    Text("Genre: \(filmDetail.filmDetails?.genre ?? "N/A")")
                    Spacer()
                    Text("Runtime: \(filmDetail.filmDetails?.runtime ?? "N/A")")
                    Spacer()
                }
                Divider()
                Text("Plot: \(filmDetail.filmDetails?.plot ?? "N/A")")
                Spacer()
            }.padding(.horizontal, 20.0)
            .offset(y: -125)
            
        }.onAppear {
            self.filmDetail.downloadFilmDetail(imdbId: imdbId)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "tt1640571")
    }
}
