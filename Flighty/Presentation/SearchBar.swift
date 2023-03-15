//
//  SearchBar.swift
//  flighty
//
//  Created by SuperMove on 2022/11/17.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var keyword: String
    @Binding var isSearching: Bool
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color("SystemGray6"))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("검색", text: $keyword)
                    .onTapGesture {
                        isSearching = true
                    }
                    .foregroundColor(.primary)
            }
            .foregroundColor(Color("SystemGray"))
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(13)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(keyword: .constant("아이"), isSearching: .constant(false))
    }
}
