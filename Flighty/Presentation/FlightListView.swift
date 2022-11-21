//
//  FlightView.swift
//  flighty
//
//  Created by SuperMove on 2022/11/17.
//

import SwiftUI

struct FlightListView: View {
    
    @Binding var keyword: String
    @State var isMyFlight: Bool
    
    var body: some View {
        VStack(alignment: .center, content: {
            HStack{
                Text(isMyFlight ? "나의 여행" : "다른 사람들의 여행")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color(UIColor.label))
                Menu {
                    Button(action: {
                        self.isMyFlight = true
                    }) {
                        Label("나의 여행", systemImage: "person.crop.circle")
                    }
                    Button(action: {
                        self.isMyFlight = false
                    }) {
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
            VStack {
                if isMyFlight {
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
                } else {
                    Text("다른 사람의 여행을 추가해봐요")
                        .fontWeight(.semibold)
                        .font(.title3)
                        .padding(.bottom, 2.0)
                    
                    Text("친구나 사랑하는 사람, 중요한 사람에게\n 제때 도착할 수 있게 계속 쫓아가 볼까요!")
                        .foregroundColor(Color(UIColor.systemGray))
                        .font(.footnote)
                        .fontWeight(.light)
                        .lineSpacing(3)
                        .multilineTextAlignment(.center)
                    
                }
            }
            .padding()
            .animation(.easeInOut(duration: 0.2))
        }).padding()
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

struct FlightListView_Preview: PreviewProvider {
    static var previews: some View {
        FlightListView(keyword: .constant(""), isMyFlight: false)
    }
}


