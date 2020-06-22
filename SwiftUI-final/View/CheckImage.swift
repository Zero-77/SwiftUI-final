//
//  CheckImage.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/6/13.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI

struct CheckImage: View {
    @State private var selectImage = Image (systemName: "camera.on.rectangle.fill" )
    @State private var showSelectPhoto = false
    @State private var showWebpage = false
    
    @State private var scale:CGFloat = 1
    @State private var newScale:CGFloat = 1
    @State private var offset=CGSize.zero
    @State private var newPosition=CGSize.zero
    
    var body: some View {
        VStack{
            Button(action: {self.showSelectPhoto=true
            }) {
                selectImage
                    .resizable()
                    .scaledToFit()
                    //.frame(width:200, height:200)
                    .clipped()
                    .scaleEffect(scale)
                    .offset(offset)
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
            }
            .buttonStyle(PlainButtonStyle())
            .sheet(isPresented:$showSelectPhoto) {
                ImagePickerController(showselectPhoto: self.$showWebpage, selectImage: self.$selectImage)
            }
        }
    }
}

struct CheckImage_Previews: PreviewProvider {
    static var previews: some View {
        CheckImage()
    }
}
