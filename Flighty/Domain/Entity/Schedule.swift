//
//  Schedule.swift
//  flighty
//
//  Created by SuperMove on 2022/11/16.
//

import Foundation

struct Schedule: Codable {
    let airlineIata, airlineIcao, flightIata, flightIcao: String
    let flightNumber, csAirlineIata, csFlightNumber, csFlightIata: String
    let depIata, depIcao, depTerminal, depGate: String
    let depTime: String
    let depTimeTs: Int
    let depTimeUTC, depEstimated: String
    let depEstimatedTs: Int
    let depEstimatedUTC, arrIata, arrIcao, arrTerminal: String
    let arrGate, arrBaggage, arrTime: String
    let arrTimeTs: Int
    let arrTimeUTC, arrEstimated: String
    let arrEstimatedTs: Int
    let arrEstimatedUTC, status: String
    let duration, delayed, depDelayed, arrDelayed: Int

    enum CodingKeys: String, CodingKey {
        case airlineIata = "airline_iata"
        case airlineIcao = "airline_icao"
        case flightIata = "flight_iata"
        case flightIcao = "flight_icao"
        case flightNumber = "flight_number"
        case csAirlineIata = "cs_airline_iata"
        case csFlightNumber = "cs_flight_number"
        case csFlightIata = "cs_flight_iata"
        case depIata = "dep_iata"
        case depIcao = "dep_icao"
        case depTerminal = "dep_terminal"
        case depGate = "dep_gate"
        case depTime = "dep_time"
        case depTimeTs = "dep_time_ts"
        case depTimeUTC = "dep_time_utc"
        case depEstimated = "dep_estimated"
        case depEstimatedTs = "dep_estimated_ts"
        case depEstimatedUTC = "dep_estimated_utc"
        case arrIata = "arr_iata"
        case arrIcao = "arr_icao"
        case arrTerminal = "arr_terminal"
        case arrGate = "arr_gate"
        case arrBaggage = "arr_baggage"
        case arrTime = "arr_time"
        case arrTimeTs = "arr_time_ts"
        case arrTimeUTC = "arr_time_utc"
        case arrEstimated = "arr_estimated"
        case arrEstimatedTs = "arr_estimated_ts"
        case arrEstimatedUTC = "arr_estimated_utc"
        case status, duration, delayed
        case depDelayed = "dep_delayed"
        case arrDelayed = "arr_delayed"
    }
}
