//
//  ContentView.swift
//  ImdbSearchApp
//
//  Created by Ali Karababa on 14.10.2021.
//

import SwiftUI

struct FilmListViewController: View {
    
   @ObservedObject var filmVM : FilmListViewModel
    @State var searchedFilm = ""
    
    
    init() {
        self.filmVM = FilmListViewModel()
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("", text: self.$searchedFilm, onCommit:  {
                    self.filmVM.searchFilm(nameOfFilm: searchedFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)
                })
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle.roundedBorder)
                
                List(filmVM.films, id: \.imdbId) { film in
                    NavigationLink(destination: DetailView(imdbId: film.imdbId), label: {
                        HStack {
                            SpecialImageView(url: film.poster)
                                .frame(width: 67.5, height: 120)
                                
                            VStack(alignment: .leading) {
                                Text(film.title)
                                    .foregroundColor(.blue)
                                    .font(.title3)
                                Text(film.year)
                                    .foregroundColor(.orange)
                            }
                        }
                    })
                
                    
                }
            }.navigationTitle(Text("Film Book by Imdb"))
        }
      
        
       
        

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListViewController()
    }
}
