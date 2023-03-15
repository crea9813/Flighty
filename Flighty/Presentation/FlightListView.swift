//
//  FlightView.swift
//  flighty
//
//  Created by SuperMove on 2022/11/17.
//

import SwiftUI
import Drawer

struct FlightListView: View {
    
    @Binding var keyword: String
    @State private var isSearching = false
    @State private var isSettingPresented = false

    var body: some View {
        NavigationView{
            Drawer {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color("SystemBackground"))
                    if isSearching {
                        FlightSearchView(isSearching: $isSearching)
                    } else {
                        SchedulesView(isSearching: $isSearching, isSettingPresented: $isSettingPresented)
                    }
                }
            }
            .rest(at: .constant(isSearching ? [750] : [250, 500, 750]))
            .impact(.medium)
            .edgesIgnoringSafeArea(.vertical)
            .onAppear { UIApplication.shared.hideKeyboard() }
        }.sheet(isPresented: $isSettingPresented, content: { SettingView() })
    }
}

struct FlightListView_Preview: PreviewProvider {
    static var previews: some View {
        FlightListView(keyword: .constant(""))
    }
}

extension View {
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
