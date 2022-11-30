//
//  MockedData.swift
//  Flighty
//
//  Created by SuperMove on 2022/11/30.
//

import Foundation

#if DEBUG

extension AirportAndAirline {
    static let mockedData: [AirportAndAirline] = [
        AirportAndAirline(iataCode: "ICN", icaoCode: "RKSI", name: "인천 국제 공항"),
        AirportAndAirline(iataCode: "SFO", icaoCode: "KSFO", name: "샌프란시스코 국제 공항"),
        AirportAndAirline(iataCode: "KE", icaoCode: "KAL", name: "대한 항공")
    ]
}

#endif
