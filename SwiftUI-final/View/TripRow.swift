//
//  TripRow.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/6/6.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI

struct TripRow: View {
    var trip:Trip
    var body: some View {
        HStack {
            Text(trip.countryname)
            Spacer()
            Text("出遊人數：\(trip.people)人")
            Image(systemName: trip.heart ? "hand.thumbsup.fill" : "hand.thumbsup")
            .resizable()
                .frame(width:50,height:50)
            Text("      ")
        }.frame(width:380,height: 60)
            .background(Color(hue: 0.527, saturation: 1.0, brightness: 1.0))
        .cornerRadius(30)
    }
}

struct TripRow_Previews: PreviewProvider {
    static var previews: some View {
        TripRow(trip: Trip(countryname: "", people: 0, heart: true, friend:  "")).previewLayout(.sizeThatFits)
    }
}
