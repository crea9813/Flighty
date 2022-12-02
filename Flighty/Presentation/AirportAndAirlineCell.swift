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
                Text("🇰🇷").font(.title2)
                VStack(alignment: .leading) {
                    Text(airportAndAirline.name)
                        .font(.headline)
                        .foregroundColor(Color("SystemGray2"))
                    Text("\(airportAndAirline.iataCode) · \(airportAndAirline.icaoCode) · 서울")
                        .font(Font.caption)
                        .foregroundColor(Color("SystemGray2"))
                    
                }
            }
            .padding(.vertical, 8)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
        .background(Color("SystemBackground"))
    }
}

struct AirportAndAirlineCell_Previews: PreviewProvider {
    static var previews: some View {
        AirportAndAirlineCell(airportAndAirline: AirportAndAirline(iataCode: "KE", icaoCode: "KAL", name: "인천 국제 공항"))
    }
}
