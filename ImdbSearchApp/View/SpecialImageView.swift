//
//  SpecialImageView.swift
//  ImdbSearchApp
//
//  Created by Ali Karababa on 18.10.2021.
//

import SwiftUI

struct SpecialImageView: View {
    let url: String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url: String) {
    
        self.url = url
        self.imageDownloaderClient.getImage(urlString: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloaderClient.downloadedImage {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }else {
            return Image(systemName: "bonjour")
                .resizable()
        }
    }
}

struct SpecialImageView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialImageView(url: "https://m.media-amazon.com/images/M/MV5BNDk4Yzc2MmItMDVhMy00Yjg1LTliNmYtOTUzZDg0ZDMyZDhhXkEyXkFqcGdeQXVyNjQzNDI3NzY@._V1_SX300.jpg")
    }
}
