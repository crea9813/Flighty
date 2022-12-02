//
//  Airport.swift
//  Flighty
//
//  Created by SuperMove on 2022/11/30.
//

import Foundation

struct Airport: Codable {
    let name: String
    let iataCode, icaoCode: String?
    let lat, lng: Double
    let countryCode: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case iataCode = "iata_code"
        case icaoCode = "icao_code"
        case lat, lng
        case countryCode = "country_code"
    }
}

typealias Airports = [Airport]
