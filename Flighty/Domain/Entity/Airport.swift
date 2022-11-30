//
//  Airport.swift
//  Flighty
//
//  Created by SuperMove on 2022/11/30.
//

import Foundation

struct Airport: Codable {
    let name, iataCode, icaoCode: String
    let lat, lng: Double
    let alt: Int
    let city, cityCode, unLocode, timezone: String
    let countryCode, phone: String
    let website: String
    let facebook, instagram, linkedin, twitter: String
    let names: Names
    let runways, departures, connections: Int
    let isMajor: Bool
    let isInternational: Int
    let slug: String

    enum CodingKeys: String, CodingKey {
        case name
        case iataCode = "iata_code"
        case icaoCode = "icao_code"
        case lat, lng, alt, city
        case cityCode = "city_code"
        case unLocode = "un_locode"
        case timezone
        case countryCode = "country_code"
        case phone, website, facebook, instagram, linkedin, twitter, names, runways, departures, connections
        case isMajor = "is_major"
        case isInternational = "is_international"
        case slug
    }
}

// MARK: - Names
struct Names: Codable {
    let no, de, hi, ln: String
    let ru, fi, pt, jv: String
    let fr, hu, wuu, uk: String
    let sk, id, mk, sv: String
    let ko, pnb, mr, el: String
    let en, `is`, it, ta: String
    let es, cs, ar, vi: String
    let th, ja, fa, pl: String
    let ro, he, tr, nl: String
}

typealias Airports = [Airport]
