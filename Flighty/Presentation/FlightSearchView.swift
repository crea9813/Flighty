//
//  FlightSearchView.swift
//  Flighty
//
//  Created by SuperMove on 2022/11/30.
//

import SwiftUI

struct FlightSearchView: View {
    @StateObject private var viewModel = FlightSearchViewModel(FlightUseCase(repository: FlightRepository(service: Networking<API>())))
    
    
    
    var body: some View {
        SearchBar(keyword: $viewModel.query).padding(.horizontal)
        List {
            if viewModel.query.isEmpty {
                hilightedText(text: "검색 창을 이용해보세요\n 아니면 아무거나 쫓아가볼까요!", target: "아무거나 쫓아가볼까요!")
                    .foregroundColor(Color(UIColor.systemGray))
                    .font(.footnote)
                    .fontWeight(.light)
                    .lineSpacing(3)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 44)
                    .listRowBackground(Color("SystemBackground"))
            } else {
                if viewModel.isLoading {
                    ListLoadingView()
                } else if viewModel.results.isEmpty {
                    Text("\(viewModel.query)와 관련된\n검색 결과가 없습니다.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(UIColor.label))
                        .listRowBackground(Color("SystemBackground"))
                } else {
                    ForEach(viewModel.results, id: \.id) { airportAndAirline in
                        AirportAndAirlineCell(airportAndAirline: airportAndAirline)
                            .listRowInsets(.init())
                    }.listRowBackground(Color("SystemBackground"))
                }
            }
        }
        .listStyle(.plain)
    }
}

extension FlightSearchView {
    
}

struct FlightSearchView_Previews: PreviewProvider {
    static var previews: some View {
        FlightSearchView()
    }
}
