//
//  FlightSearchView.swift
//  Flighty
//
//  Created by SuperMove on 2022/11/30.
//

import SwiftUI

struct FlightSearchView: View {
    
    @StateObject private var viewModel = FlightSearchViewModel(FlightUseCase(repository: FlightRepository(service: Networking<API>())))
    @Binding var isSearching: Bool
    
    var body: some View {
        VStack{
            HStack {
                Text("검색")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color(UIColor.label))
                Spacer()
                Button(action: { isSearching = false }) {
                    Image(systemName: "multiply")
                        .font(Font.headline.weight(.bold))
                        .foregroundColor(.primary)
                }.frame(width: 28, height: 28)
            }.padding()
            
            SearchBar(keyword: $viewModel.query, isSearching: .constant(false))
                .padding(.horizontal)
            
            if viewModel.query.isEmpty {
                notRequestedView
            } else {
                if viewModel.isLoading {
                    ListLoadingView()
                } else {
                    loadedView(viewModel.results)
                }
            }
            Spacer()
        }
    }
}

private extension FlightSearchView {
    var notRequestedView: some View {
        Text("검색 창을 이용해 보세요")
            .foregroundColor(Color(UIColor.systemGray))
            .font(.footnote)
            .fontWeight(.light)
            .lineSpacing(3)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 44)
            .listRowBackground(Color("SystemBackground"))
    }
    
    var loadingView: some View {
        ListLoadingView()
    }
    
    func loadedView(_ items: [AirportAndAirline]) -> some View {
        VStack {
            if items.isEmpty {
                Text("\(viewModel.query)와 관련된\n검색 결과가 없습니다.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(UIColor.label))
                    .listRowBackground(Color("SystemBackground"))
            } else {
                List(items, id: \.id) { item in
                    AirportAndAirlineCell(airportAndAirline: item)
                        .id(item.id)
                        .listRowInsets(.init())
                }
                .listStyle(.plain)
            }
        }
    }
}

struct FlightSearchView_Previews: PreviewProvider {
    static var previews: some View {
        FlightSearchView(isSearching: .constant(false))
    }
}
