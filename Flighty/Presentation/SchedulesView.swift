//
//  SchedulesView.swift
//  Flighty
//
//  Created by Supermove on 2023/03/15.
//

import SwiftUI

struct SchedulesView: View {
    
    @Binding var isSearching: Bool
    @Binding var isSettingPresented: Bool
    
    @State private var menu: ScheduleMenu = .my
    
    var body: some View {
        VStack {
            HStack {
                Text(menu == .my ? "나의 여행" : "다른 사람의 여행")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color(UIColor.label))
                Menu {
                    Button(action: {
                        menu = .my
                    }) {
                        Label("나의 여행", systemImage: "person.crop.circle")
                    }
                    Button(action: {
                        menu = .others
                    }) {
                        Label("다른 사람들의 여행", systemImage: "person.2")
                    }
                } label: {
                    CircleIconView(name: "chevron.down")
                }.frame(width: 24, height: 24)
                
                Spacer()
                
                Button(action: { isSettingPresented = true }) {
                    CircleIconView(name: "gearshape")
                }.frame(width: 28, height: 28)
                
            }.padding()
            SearchBar(keyword: .constant(""), isSearching: $isSearching).padding(.horizontal)
            Text(menu == .my ? "어디로든 떠나봐요" : "다른 사람의 여행을 추가해봐요")
                .fontWeight(.semibold)
                .font(.title3)
                .padding(.top, 20)
                .padding(.bottom, 2)
            Button(action: { isSearching = true }) {
                hilightedText(text: menu == .my ? "검색 창을 이용해보세요\n 아니면 아무거나 쫓아가 볼까요!" : "친구나 사랑하는 사람, 중요한 사람에게\n 제때 도착할 수 있게 쫓아가 볼까요!", target:  menu == .my ? "아무거나 쫓아가 볼까요!" : "쫓아가 볼까요!")
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



struct SchedulesView_Previews: PreviewProvider {
    static var previews: some View {
        SchedulesView(isSearching: .constant(false), isSettingPresented: .constant(false))
    }
}
