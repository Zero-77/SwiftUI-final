//
//  openview.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/6/4.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI

struct openview: View {
    @State private  var showtripList = false
    var body: some View {
        VStack{
            HStack{
                Text("新增旅遊➡️").font(.custom("HelveticaNeue",size:30))
                Button(action:{
                    self.showtripList=true
                }){
                    Image(systemName: "airplane")
                        .resizable()
                        .frame(width:50,height: 50)
                }.sheet(isPresented:$showtripList){
                    TripList()
                }
            }
            
            TabView{
                TripView().tabItem{
                    Image(systemName:"rosette")
                    Text("旅遊清單")
                }
                UnsplashView().tabItem{
                    Image(systemName:"checkmark.seal.fill")
                    Text("關於Unsplash")
                }
                
                locationList().tabItem{
                    Image(systemName:"airplane")
                    Text("旅遊國家")
                }
                
                picturewall().tabItem{
                    Image(systemName:"photo.fill")
                    Text("旅遊相片牆")
                }
                
                CheckImage().tabItem{
                    Image(systemName:"eye.fill")
                    Text("查看圖片")
                }
            }
            
        }
    }
}

struct openview_Previews: PreviewProvider {
    static var previews: some View {
        openview()
    }
}
