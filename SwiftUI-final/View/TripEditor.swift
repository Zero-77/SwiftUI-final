//
//  TripEditor.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/6/6.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI

struct TripEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var tripsData:TripData
    @State private var countryname = ""
    @State private var people = 1
    @State private var heart = true
    @State private var friend = ""
    var editTrip: Trip?
    
    var body: some View {
        Form {
                TextField("旅遊地", text: $countryname)
                    .background(Color.yellow)
                Stepper("出遊人數：\(people)", value: $people, in: 1...100)
                    .background(Color.red)
                Toggle("標註一定要去～", isOn: $heart)
                    .background(Color.blue)
                TextField("邀請朋友", text: $friend)
                    .background(Color.orange)
            }
            .navigationBarTitle("Add new Trip")
            .navigationBarItems(trailing: Button("Save") {
                
                let trip = Trip(countryname: self.countryname, people: self.people, heart: self.heart,friend: self.friend)
                
                if let editTrip = self.editTrip {
                    let index = self.tripsData.trips.firstIndex {
                        $0.id == editTrip.id
                    }!
                    self.tripsData.trips[index] = trip
                } else {
                    self.tripsData.trips.insert(trip, at: 0)
                }

                
                self.presentationMode.wrappedValue.dismiss()
            })
                .onAppear {
                    
                    if let editTrip = self.editTrip {
                        self.countryname = editTrip.countryname
                        self.people = editTrip.people
                        self.heart = editTrip.heart
                        self.friend = editTrip.friend
                    }
        }
    }
}

struct TripEditor_Previews: PreviewProvider {
    static var previews: some View {
        TripEditor(tripsData: TripData())
    }
}
