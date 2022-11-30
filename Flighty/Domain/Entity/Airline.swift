//
//  Airline.swift
//  Flighty
//
//  Created by SuperMove on 2022/11/30.
//

import Foundation

// MARK: - Airline
struct Airline: Codable {
    let name, iataCode: String
    let iataPrefix, iataAccounting: Int
    let icaoCode, callsign, countryCode: String
    let iosaRegistered, isScheduled, isPassenger, isCargo: Int
    let isInternational, totalAircrafts, averageFleetAge, accidentsLast5Y: Int
    let crashesLast5Y: Int
    let website, facebook, twitter, instagram: String
    let linkedin, slug: String

    enum CodingKeys: String, CodingKey {
        case name
        case iataCode = "iata_code"
        case iataPrefix = "iata_prefix"
        case iataAccounting = "iata_accounting"
        case icaoCode = "icao_code"
        case callsign
        case countryCode = "country_code"
        case iosaRegistered = "iosa_registered"
        case isScheduled = "is_scheduled"
        case isPassenger = "is_passenger"
        case isCargo = "is_cargo"
        case isInternational = "is_international"
        case totalAircrafts = "total_aircrafts"
        case averageFleetAge = "average_fleet_age"
        case accidentsLast5Y = "accidents_last_5y"
        case crashesLast5Y = "crashes_last_5y"
        case website, facebook, twitter, instagram, linkedin, slug
    }
}

typealias Airlines = [Airline]
