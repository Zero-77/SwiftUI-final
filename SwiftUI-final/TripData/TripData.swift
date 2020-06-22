//
//  TripData.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/6/5.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import Foundation
import Combine

class TripData:ObservableObject{
    @Published var trips=[Trip]()
    var cancellable:AnyCancellable?
    
    init(){
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let url = documentsDirectory.appendingPathComponent("trip")
        
        if let data = try? Data(contentsOf:url){
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Trip].self, from: data){
                trips=decodedData
            }
        }
        //cancellable
        cancellable = $trips
            .sink{ (value) in
                let encoder = JSONEncoder()
                do{
                    let data = try encoder.encode(value)
                    try? data.write(to:url)
                }catch{
                    
                }
        }
    }
}
