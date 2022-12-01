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
        SearchBar(keyword: $viewModel.query)
        List {
            if viewModel.query.isEmpty {
                Text("검색 전")
            } else {
                if viewModel.isLoading {
                    Text("로딩 중")
                } else {
                    if viewModel.results.isEmpty {
                        Text("없음")
                    } else {
                        ForEach(viewModel.results, id: \.id) { airportAndAirline in
                            AirportAndAirlineCell(airportAndAirline: airportAndAirline)
                        }
                    }
                }
            }
        }
    }
}

extension FlightSearchView {
    
}

struct FlightSearchView_Previews: PreviewProvider {
    static var previews: some View {
        FlightSearchView()
    }
}
