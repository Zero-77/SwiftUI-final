//
//  MapView.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/6/13.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI
import MapKit
struct MapView: UIViewRepresentable {
    var annotations = [MKPointAnnotation]()
       
       let coordinate: CLLocationCoordinate2D
        func makeUIView(context: Context) -> MKMapView {
           let mapView = MKMapView()
           let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
           mapView.setRegion(region, animated: true)
           return mapView
           
       }
       
       func updateUIView(_ uiView: MKMapView, context: Context) {
       }
       
       typealias UIViewType = MKMapView
}
