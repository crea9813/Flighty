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
    
    @Binding var keyword: String
    
    var body: some View {
        ZStack {
            MapView(region: region, mapType: mapType).ignoresSafeArea(.all)
            
            Drawer {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color("SystemBackground"))
                    
                    VStack {
                        FlightListView(keyword: $keyword, isMyFlight: isMyFlight)
                        Spacer()
                    }
                }
            }
            .rest(at: .constant([250, 500]))
            .impact(.medium)
            .edgesIgnoringSafeArea(.vertical)
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(keyword: .constant(""))
    }
}

