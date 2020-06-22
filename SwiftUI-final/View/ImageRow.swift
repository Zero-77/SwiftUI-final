//
//  ImageRow.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/5/31.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI

struct ImageRow: View {
    var Img: Imagedetail
    
    @State private var image = Image(systemName: "photo")
    @State private var downloadImageOk = false
    func downLoad() {
           if let data = try? Data(contentsOf: Img.urls.thumb), let uiImage = UIImage(data: data) {
               self.image = Image(uiImage: uiImage)
               self.downloadImageOk = true
           }
       }
    var body: some View {
        HStack{
            image
                .resizable()
                .scaledToFit()
                .frame(width:200)
                .onAppear {
                    if self.downloadImageOk == false {
                        self.downLoad()
                    }
            }
            VStack(alignment: .leading) {
                Text("作者(攝影師)：\(Img.user.name)")
            }
        }
            .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: UnitPoint(x: 1, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
    .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius:20).stroke(Color.yellow,lineWidth:5))
    }
}

/*struct ImageRow_Previews: PreviewProvider {
 static var previews: some View {
 ImageRow()
 }
 }*/
