//
//  MapView.swift
//  flighty
//
//  Created by SuperMove on 2022/11/17.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let region: MKCoordinateRegion
    let mapType: MKMapType
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.setRegion(region, animated: false)
        mapView.mapType = mapType
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.mapType = mapType
    }
    
    func makeCoordinator() -> MapCoordinator {
        MapCoordinator()
    }
    
    final class MapCoordinator: NSObject, MKMapViewDelegate {
        
    }
}
