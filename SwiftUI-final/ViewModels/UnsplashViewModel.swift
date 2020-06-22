//
//  UnsplashViewModel.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/6/10.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import Foundation

class UnsplashViewModel:ObservableObject{
    
    @Published var statsMonthresults: StatsMonthresults?
    
    func fetchResult(){
        if let urlStr =  "https://api.unsplash.com/stats/month?&client_id=RRdF5QWGOYlYXrD02rPIbuAQe3MyTd-iYVGON3yVSaM".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),let url=URL(string:urlStr){
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                if let data = data, let statsMonthresults = try? JSONDecoder().decode(StatsMonthresults.self, from:data) {
                   print(statsMonthresults)
                    DispatchQueue.main.async {
                        self.statsMonthresults = statsMonthresults
                    }//在main thread下執行
                } else {
                    print("error")
                }
            }.resume()
        }
    }
}
