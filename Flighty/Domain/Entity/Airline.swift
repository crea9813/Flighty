//
//  Airline.swift
//  Flighty
//
//  Created by SuperMove on 2022/11/30.
//

import Foundation

// MARK: - Airline
struct Airline: Codable {
    let name: String
    let iataCode, icaoCode: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case iataCode = "iata_code"
        case icaoCode = "icao_code"
    }
}

typealias Airlines = [Airline]
