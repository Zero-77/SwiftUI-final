//
//  ImageList.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/5/31.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI
import CoreLocation

struct ImageList: View {
    @ObservedObject var ImgListViewModel = ImageListViewModel()
    let country:countrys
    @State private var showsafarivideo = false
    @State private var showmapview = false
    var body: some View {
        //NavigationView{
        ZStack{
            List(ImgListViewModel.ImageD, rowContent: { (Img) in
                //picturewall(Img: Img)
                NavigationLink(destination: ImageDetail(Img: Img)) {
                    ImageRow(Img: Img)
                }
            })
                .onAppear {
                    self.ImgListViewModel.fetchImage(name: self.country.Name)
            }
            //}
            
            Button("旅遊介紹影片") {
                self.showsafarivideo = true
                //self.urlString = self.country.url
            }
            .buttonStyle(PlainButtonStyle())
            .frame(width:120,height:50)
            .background(Color.pink)
            .cornerRadius(30)
                
            .offset(x:-100,y:-280)
            .sheet(isPresented: $showsafarivideo) {
                //NavigationView {
                SafariView(url: URL(string: self.country.url)!)
                //}
            }
            Button("旅遊地圖") {
                self.showmapview = true
            }
            .buttonStyle(PlainButtonStyle())
            .frame(width:100,height:50)
            .background(Color.purple)
            .cornerRadius(30)
                
            .offset(x:100,y:-280)
            .sheet(isPresented: $showmapview) {
                NavigationView {
                    MapView(coordinate: CLLocationCoordinate2D(latitude: self.country.latitude, longitude: self.country.longitude))
                    .navigationBarTitle("旅遊國家地圖")
                }
            }
        }
    }
}

struct ImageList_Previews: PreviewProvider {
    static var previews: some View {
        ImageList(country:countrys(Name:"", url: "",latitude: 0,longitude: 0))
    }
}
