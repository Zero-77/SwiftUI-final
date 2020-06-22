//
//  Trip.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/6/5.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import Foundation


struct Trip: Identifiable,Codable{
    let id = UUID()
    var countryname:String
    var people:Int
    var heart:Bool
    var friend:String
    //var date:Date
}
