//
//  SwiftUIView.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/6/1.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI

struct locationRow: View {
    let country:countrys
    var body: some View {
        HStack{
            Text(country.Name)
                .font(.custom("GillSans-Italic",size:50))
        }.background(Image(country.Name).resizable().frame(width:350,height: 150).scaledToFill().opacity(0.3)).frame(width:350,height: 150).clipped()
    }
}

struct locationRow_Previews: PreviewProvider {
    static var previews: some View {
        locationRow(country:countrys(Name:"Taiwan", url: "",latitude: 0,longitude: 0))
    }
}
