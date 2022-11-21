//
//  CircleIconButton.swift
//  flighty
//
//  Created by SuperMove on 2022/11/17.
//

import SwiftUI

struct CircleIconView: View {
    
    private let icon: String
    
    init(name: String) {
        self.icon = name
    }
    
    var body: some View {
        ZStack{
            Circle().fill(Color("SystemGray6"))
            Image(systemName: "\(icon)")
                .resizable()
                .scaledToFit()
                .font(Font.headline.weight(.bold))
                .scaleEffect(0.55)
                .foregroundColor(.primary)
        }
    }
}
