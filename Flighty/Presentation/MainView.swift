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
    
    @Binding var keyword: String
    
    var body: some View {
        ZStack {
            MapView(region: region, mapType: mapType).ignoresSafeArea(.all)
            
            Drawer {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color("SystemBackground"))
                    
                    VStack {
                        FlightListView(keyword: $keyword)
                        VStack {
                            Text("어디로든 떠나봐요")
                                .fontWeight(.semibold)
                                .font(.title3)
                                .padding(.bottom, 2.0)
                            
                            hilightedText(text: "검색 창을 이용해보세요\n 아니면 아무거나 쫓아가볼까요!", target: "아무거나 쫓아가볼까요!")
                                .foregroundColor(Color(UIColor.systemGray))
                                .font(.footnote)
                                .fontWeight(.light)
                                .lineSpacing(3)
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                    }
                }
            }
            .rest(at: .constant([250, 500]))
            .impact(.light)
            .edgesIgnoringSafeArea(.vertical)
            
        }
    }
    
    func hilightedText(text: String, target: String) -> Text {
        guard !text.isEmpty && !target.isEmpty else { return Text(text) }
        
        var result: Text!
        let parts = text.components(separatedBy: target)
        for i in parts.indices {
            result = (result == nil ? Text(parts[i]) : result + Text(parts[i]))
            if i != parts.count - 1 {
                result = result + Text(target).foregroundColor(.blue)
            }
        }
        return result ?? Text(text)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(keyword: .constant(""))
    }
}

