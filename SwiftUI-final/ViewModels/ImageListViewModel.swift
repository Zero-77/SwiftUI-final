//
//  ImageListViewModel.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/5/31.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import Foundation

class ImageListViewModel:ObservableObject{
    @Published var ImageD = [Imagedetail]()
    //@Published var urlsD = [urlsDetail]()
    //@Published var linksD = [linksDetail]()
    //@Published var userD = [userDetail]()
    //@Published var photographerD = [photographerDetail]()
    
    func fetchImage(name:String){
        if let urlStr =  "https://api.unsplash.com/search/photos?query=\(name)&client_id=RRdF5QWGOYlYXrD02rPIbuAQe3MyTd-iYVGON3yVSaM&per_page=10".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),let url=URL(string:urlStr){
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                let decoder = JSONDecoder()
                if let data = data, let ImageResults = try? decoder.decode(ImageResults.self, from: data) {
                    DispatchQueue.main.async {
                        self.ImageD = ImageResults.results
                        
                    }
                }
                /*let urlsResults = try? decoder.decode(ImageDetail.self, from: data) {
                    DispatchQueue.main.async {
                        self.urlsD = ImageDetail.urls
                        
                    }
                }
                let linksResults = try? decoder.decode(ImageDetail.self, from: data) {
                    DispatchQueue.main.async {
                        self.linksD = ImageDetail.links
                        
                    }
                }
                let userResults = try? decoder.decode(ImageDetail.self, from: data) {
                    DispatchQueue.main.async {
                        self.urlsD = ImageDetail.user
                        
                    }
                }*/
            }.resume()
        }
    }
}
