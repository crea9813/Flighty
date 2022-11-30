//
//  FlightRepositoryInterface.swift
//  flighty
//
//  Created by SuperMove on 2022/11/16.
//

import Combine

protocol FlightRepositoryInterface {
    func getFlights() -> AnyPublisher<Flights, Error>
    func getFlight(_ flightID: String) -> AnyPublisher<Flight, Error>
    func getAirports() -> AnyPublisher<Airports, Error>
    func getAirlines() -> AnyPublisher<Airlines, Error>
}

