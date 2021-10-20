//
//  ImageDownloaderClient.swift
//  ImdbSearchApp
//
//  Created by Ali Karababa on 18.10.2021.
//

import Foundation


class ImageDownloaderClient: ObservableObject {
    
    @Published var downloadedImage : Data?
    
    func getImage(urlString: String) {
        
        
        guard let imageURL = URL(string: urlString) else {return}
        
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else {return}
            
            DispatchQueue.main.async {
                self.downloadedImage = data
            }
        }.resume()
    }

    enum DownLoaderError {
        case wrongURL
        case notArrivedData
        case unProcessData
    }
    
    
}
