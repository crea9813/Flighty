//
//  AirportAndAirlineCell.swift
//  Flighty
//
//  Created by SuperMove on 2022/11/29.
//

import SwiftUI

struct AirportAndAirline {
    var iataCode, icaoCode: String
    var name: String
}

extension AirportAndAirline: Identifiable {
    var id: String { iataCode }
}

struct AirportAndAirlineCell: View {
    var airportAndAirline: AirportAndAirline
    
    var body: some View {
        VStack {
            HStack {
                Text("🇰🇷").font(.title)
                VStack(alignment: .leading) {
                    Text(airportAndAirline.name)
                    Text("\(airportAndAirline.iataCode) · \(airportAndAirline.icaoCode) · 서울")
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
    }
}

struct AirportAndAirlineCell_Previews: PreviewProvider {
    static var previews: some View {
        AirportAndAirlineCell(airportAndAirline: AirportAndAirline(iataCode: "KE", icaoCode: "KAL", name: "인천 국제 공항"))
    }
}
