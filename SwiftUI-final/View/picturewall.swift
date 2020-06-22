//
//  picturewall.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/6/3.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI
import WaterfallGrid
struct picturewall: View {
    var body: some View {
        NavigationView{
            WaterfallGrid((0..<21), id: \.self) { index in
                Image("country\(index)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }.gridStyle(
                columns:2,
                animation: .easeInOut(duration: 0.5)
            )
                .scrollOptions(
                    direction: .horizontal,
                    showsIndicators: true
            ).offset(x:0,y:-50)
        }
        
    }
}

struct picturewall_Previews: PreviewProvider {
    static var previews: some View {
        picturewall()
    }
}
