//
//  APICaller.swift
//  ImdbSearchApp
//
//  Created by Ali Karababa on 14.10.2021.
//

import Foundation


class ApiCaller {
    
    
    func getData(search: String, completion: @escaping (Result<[FilmModel]?, DownloaderError>) -> (Void)) {
        guard let urlStirng = URL(string: "http://www.omdbapi.com/?s=\(search)&apikey=625d4814" ) else {
            return completion(.failure(.wrongURL))
        }
        
        URLSession.shared.dataTask(with: urlStirng) { data, response, error in
            guard let data = data, error == nil else {
                print("Error was occured: \(error?.localizedDescription ?? "Error happened")!")
                return completion(.failure(.dataNotArrive))
                
            }
            
            guard  let dataResponse = try? JSONDecoder().decode(ReceivedFilmsModel.self, from: data) else {
                return completion(.failure(.dataNotProcess))
               
            }
            
            
            completion(.success(dataResponse.films))
        }.resume()
        
    }
    
    
}


enum DownloaderError: Error {
    case wrongURL
    case dataNotArrive
    case dataNotProcess
}
