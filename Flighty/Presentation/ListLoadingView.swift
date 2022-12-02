//
//  ListLoadingView.swift
//  Flighty
//
//  Created by SuperMove on 2022/12/02.
//

import SwiftUI

struct ListLoadingView: View {
    var body: some View {
        HStack {
            Spacer()
            ProgressView()
            Spacer()
        }.listRowBackground(Color("SystemBackground"))
    }
}

struct ListLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ListLoadingView()
    }
}
