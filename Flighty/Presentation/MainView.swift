//
//  MainView.swift
//  flighty
//
//  Created by SuperMove on 2022/11/17.
//

import SwiftUI
import MapKit
import Drawer

struct MainView: View {
    @State private var region = MKCoordinateRegion()
    @State private var mapType: MKMapType = .hybridFlyover
    @State private var isMyFlight: Bool = false
    
    @ObservedObject public var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            MapView(region: region, mapType: mapType).ignoresSafeArea(.all)
            
            FlightListView(keyword: $viewModel.searchText)
        }
    }
}

