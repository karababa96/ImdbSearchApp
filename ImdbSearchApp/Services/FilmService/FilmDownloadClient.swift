//
//  FilmDownloadClient.swift
//  ImdbSearchApp
//
//  Created by Ali Karababa on 18.10.2021.
//

import Foundation
import SwiftUI

class FilmDownloaderClient {
    
    
    
    func downloadDeatils(imdbId: String, completion: @escaping (Result<DetailModel?, DownloaderError>) -> Void)  {
        
        guard let url = URL(string: "http://www.omdbapi.com/?i=\(imdbId)&apikey=625d4814") else {
            return completion(.failure(.wrongURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.dataNotArrive))
            }
            
            guard let details = try? JSONDecoder().decode(DetailModel.self, from: data) else {
                return completion(.failure(.dataNotProcess))
            }
            
            completion(.success(details))

        }.resume()
    }
}



