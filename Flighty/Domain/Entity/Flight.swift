//
//  Flight.swift
//  flighty
//
//  Created by SuperMove on 2022/11/16.
//

import Foundation

struct Flight: Codable {
    let hex: String
    let regNumber, flag: String?
    let lat, lng: Double
    let alt, dir, speed: Int
    let vSpeed: Double?
    let squawk, airlineIcao, airlineIata, aircraftIcao: String?
    let updated: Int
    let status: Status
    let flightNumber, flightIcao, depIcao, depIata: String?
    let flightIata, arrIcao, arrIata: String?

    enum CodingKeys: String, CodingKey {
        case hex
        case regNumber = "reg_number"
        case flag, lat, lng, alt, dir, speed
        case vSpeed = "v_speed"
        case squawk
        case airlineIcao = "airline_icao"
        case airlineIata = "airline_iata"
        case aircraftIcao = "aircraft_icao"
        case updated, status
        case flightNumber = "flight_number"
        case flightIcao = "flight_icao"
        case depIcao = "dep_icao"
        case depIata = "dep_iata"
        case flightIata = "flight_iata"
        case arrIcao = "arr_icao"
        case arrIata = "arr_iata"
    }
}

enum Status: String, Codable {
    case enRoute = "en-route"
    case landed = "landed"
    case scheduled = "scheduled"
}
