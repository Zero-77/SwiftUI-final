//
//  TripView.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/6/6.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI
struct testt:Shape{
    var floor = 0
    var y = 0
    
    @State private var ii = "123"
    @ObservedObject var tripsData = TripData()
    func path (in rect: CGRect ) -> Path {
        Path { (path) in
            if(tripsData.trips.count % 4) == 0{
                if(tripsData.trips.count/4)==1{
                    for j in (0...(tripsData.trips.count)-1){
                        path.move(to:CGPoint(x:50+j*100,y:50))
                        path.addCurve(to: CGPoint(x:50+j*100,y:120), control1: CGPoint(x:0+j*100,y:0), control2: CGPoint(x:0+j*100,y:90))
                        path.addCurve(to: CGPoint(x:50+j*100,y:50), control1: CGPoint(x:150+j*100,y:50), control2: CGPoint(x:70+j*100,y:-30))
                        path.closeSubpath ()
                    }
                }
                else{
                    for i in (0...(tripsData.trips.count/4)){
                        if(i != (tripsData.trips.count/4)){
                            for j in (0...3){
                                path.move(to:CGPoint(x:50+j*100,y:50+i*100))
                                path.addCurve(to: CGPoint(x:50+j*100,y:120+i*100), control1: CGPoint(x:0+j*100,y:0+i*100), control2: CGPoint(x:0+j*100,y:90+i*100))
                                path.addCurve(to: CGPoint(x:50+j*100,y:50+i*100), control1: CGPoint(x:150+j*100,y:50+i*100), control2: CGPoint(x:70+j*100,y:-30+i*100))
                                path.closeSubpath ()
                            }
                        }//if
                    }
                }
            }//floor==4*
            else{
                for i in (0...(tripsData.trips.count/4)){
                    if(i != (tripsData.trips.count/4)){
                        for j in (0...3){
                            path.move(to:CGPoint(x:50+j*100,y:50+i*100))
                            path.addCurve(to: CGPoint(x:50+j*100,y:120+i*100), control1: CGPoint(x:0+j*100,y:0+i*100), control2: CGPoint(x:0+j*100,y:90+i*100))
                            path.addCurve(to: CGPoint(x:50+j*100,y:50+i*100), control1: CGPoint(x:150+j*100,y:50+i*100), control2: CGPoint(x:70+j*100,y:-30+i*100))
                            path.closeSubpath ()
                        }
                    }//if
                    else if(i == (tripsData.trips.count/4)){
                        for j in (0...(tripsData.trips.count % 4)-1){
                            path.move(to:CGPoint(x:50+j*100,y:50+i*100))
                            path.addCurve(to: CGPoint(x:50+j*100,y:120+i*100), control1: CGPoint(x:0+j*100,y:0+i*100), control2: CGPoint(x:0+j*100,y:90+i*100))
                            path.addCurve(to: CGPoint(x:50+j*100,y:50+i*100), control1: CGPoint(x:150+j*100,y:50+i*100), control2: CGPoint(x:70+j*100,y:-30+i*100))
                            path.closeSubpath ()
                        }
                    }//else if
                }
            }
        }
        
    }
}

struct TripView: View {
    @ObservedObject var tripsData = TripData()
    var body: some View {
        
        NavigationView{
            VStack{
                ScrollView{
                    Text("旅遊印章:\(tripsData.trips.count)").font(.custom("HelveticaNeue",size:30))
                    testt()
                        .fill(Color(hue: 0.937, saturation: 1.0, brightness: 1.0))
                        .frame(height:CGFloat(((tripsData.trips.count/4)+1)*110))
                }
                .offset(y:-50)
                List{
                    ForEach(tripsData.trips){(trip) in
                        TripViewRow(trip: trip)
                    }
                }//list
                    .frame(height:300)
                    .offset(y:-10)
            }
        }//navigationview
        //}//scrollview
    }
}

struct TripView_Previews: PreviewProvider {
    static var previews: some View {
        TripView()
    }
}
