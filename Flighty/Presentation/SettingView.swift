//
//  SettingView.swift
//  Flighty
//
//  Created by Supermove on 2023/03/15.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Text("Setting Form")
        }
        .navigationTitle("설정")
        .toolbar {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Done").bold().foregroundColor(.primary)
            })
        }
    }
}
