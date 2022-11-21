//
//  FlightView.swift
//  flighty
//
//  Created by SuperMove on 2022/11/17.
//

import SwiftUI

struct FlightListView: View {
    
    @Binding var keyword: String
    
    var body: some View {
        VStack(alignment: .leading, content: {
            HStack{
                Text("나의 여행")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color(UIColor.label))
                Menu {
                    Button(action: {}) {
                        Label("나의 여행", systemImage: "person.crop.circle")
                    }
                    Button(action: {}) {
                        Label("다른 사람들의 여행", systemImage: "person.2")
                    }
                } label: {
                    CircleIconView(name: "chevron.down")
                }.frame(width: 24, height: 24)
                Spacer()
                Button(action: { }) {
                    CircleIconView(name: "gearshape")
                }.frame(width: 28, height: 28)
            }
            SearchBar(keyword: $keyword)
        }).padding()
    }
}

