//
//  ImageResults.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/5/30.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import Foundation


struct ImageResults: Codable {
    let total: Int
    //let total_pages: Int
    let results: [Imagedetail]
}
struct Imagedetail: Codable,Identifiable{
    let id: String
    let description:String?
    let width:Int
    let height:Int
    let urls: urlsDetail
    let links: linksDetail
    let user: userDetail
}
struct urlsDetail:Codable{
    let full:URL//full-url
    let small:URL//small-url
    let regular:URL//regular-url
    let thumb:URL//thumb-url
}
struct linksDetail:Codable {
    let html:URL//links-html-url
}
struct userDetail:Codable {
    let name:String//user-name
    //let IG_username:String?//user-instagram_username
    let links: photographerDetail
    
}
struct photographerDetail:Codable {
    let html:URL//user-links-html
}
