//
//  ImageDetail.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/5/31.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI
import WaterfallGrid
struct ImageDetail: View {
    var Img: Imagedetail
    @State private var image = Image(systemName: "photo")
    @State private var downloadImageOk = false
    func downLoad() {
        if let data = try? Data(contentsOf: Img.urls.regular), let uiImage = UIImage(data: data) {
            self.image = Image(uiImage: uiImage)
            self.downloadImageOk = true
        }
    }
    //@State private var showAlert = false
    @State private var scale:CGFloat = 1
    @State private var newScale:CGFloat = 1
    @State private var offset=CGSize.zero
    @State private var newPosition=CGSize.zero
    
    //let country:countrys
    var body: some View {
        VStack {
            image
                .resizable()
                .scaledToFit()
                .scaleEffect(scale)
                .offset(offset)
                .onAppear {
                    if self.downloadImageOk == false {
                        self.downLoad()
                    }
            }
            .gesture(DragGesture().onChanged({(value) in
                self.offset=CGSize(width:value.translation.width+self.newPosition.width,height: value.translation.height+self.newPosition.height)})
                .onEnded({(value) in
                    self.newPosition=self.offset
                })
            )
                .gesture(MagnificationGesture().onChanged{ value in
                    self.scale=self.newScale * value.magnitude
                }.onEnded{ value in
                    self.newScale = self.scale
                })
            
            Group{
                Text("作者/攝影師/藝術家：\(Img.user.name)")
                Text("原始圖片寬度:\(String(Img.width))\n原始圖片高度:\(String(Img.height))")
                if(Img.description==nil){
                    Text("描述：None")
                }
                else{
                    Text("描述：\(Img.description ?? "")")
                }
            }//group 基本資料
            // 
            //****Text(Img.urls.full.absoluteString)
            Group {
                Button("Unsplash網址"){
                    //self.showAlert = true
                    if let url = URL(string: self.Img.links.html.absoluteString) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:])
                        }
                    }
                }.frame(width:200,height:50)
                    .font(.custom("Copperplate",size:25))
                    .background(Color.pink)
                    .foregroundColor(.black)
                    .cornerRadius(50)
                Button("作者頁面"){
                    //self.showAlert = true
                    if let url = URL(string: self.Img.user.links.html.absoluteString) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:])
                        }
                    }
                }.frame(width:150,height:50)
                    .font(.custom("Copperplate",size:25))
                    .background(Color.yellow)
                    .foregroundColor(.black)
                    .cornerRadius(50)
            }//group button
        }
        
    }
}

/*struct ImageDetail_Previews: PreviewProvider {
 static var previews: some View {
 ImageDetail()
 }
 }*/
