//
//  TripList.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/6/6.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI

struct TripList: View {
    
    @ObservedObject var tripsData = TripData()
    @State private var showEditTrip = false
    var body: some View {
        NavigationView{
            List{
                ForEach(tripsData.trips){(trip) in
                    NavigationLink(destination:TripEditor(tripsData: self.tripsData, editTrip: trip)){
                        TripRow(trip: trip)
                    }
                }
                .onDelete{(indexSet) in
                    self.tripsData.trips.remove(atOffsets:indexSet)
                }
            }
            .navigationBarTitle("旅遊列表")
            .navigationBarItems(leading: EditButton() , trailing: Button(action: {
                self.showEditTrip = true
            }) {
                Image(systemName: "calendar.badge.plus") .resizable()
                                   .frame(width:50,height: 50)
            })
                .sheet(isPresented: $showEditTrip) {
                    NavigationView {
                        TripEditor(tripsData: self.tripsData)
                        
                    }
            }
        }
    }
}

struct TripList_Previews: PreviewProvider {
    static var previews: some View {
        TripList()
    }
}
