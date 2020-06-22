//
//  TripViewRow.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/6/9.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI

struct TripViewRow: View {
    var trip:Trip
    var body: some View {
        HStack {
            Text("\(trip.countryname)").font(.custom("GillSans-UltraBold",size:30))
                .foregroundColor(.black)
        }.frame(width:370,height:80)
            .background(RadialGradient(gradient: Gradient(colors: [Color.white, Color.blue,Color.white,Color.green]), center: .center, startRadius:
        25, endRadius: 150))
        .cornerRadius(30)
    }
}

struct TripViewRow_Previews: PreviewProvider {
    static var previews: some View {
        TripViewRow(trip: Trip(countryname: "", people: 0, heart: true, friend: "")).previewLayout(.sizeThatFits)
    }
}
