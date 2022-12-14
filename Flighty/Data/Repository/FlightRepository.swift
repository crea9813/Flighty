//
//  FlightRepository.swift
//  flighty
//
//  Created by SuperMove on 2022/11/16.
//

import Foundation
import Combine

final class FlightRepository: FlightRepositoryInterface {
    
    private let service: Networking<API>
    
    init(service: Networking<API>) {
        self.service = service
    }
    
    func getFlights() -> AnyPublisher<Flights, Error> {
        return service.request(.flights())
            .map(BaseModel<Flights>.self)
            .map { $0.response ?? [] }
            .eraseToAnyPublisher()
    }
    
    func getFlight(_ flightID: String) -> AnyPublisher<Flight, Error> {
        return service.request(.flights(FlightRequestModel(reg_number: flightID)))
            .map(BaseModel<Flights>.self)
            .map { $0.response!.first! }
            .eraseToAnyPublisher()
    }
    
    func getAirports() -> AnyPublisher<Airports, Error> {
        return service.request(.airports)
            .map(BaseModel<Airports>.self)
            .map { $0.response ?? [] }
            .eraseToAnyPublisher()
    }
    
    func getAirlines() -> AnyPublisher<Airlines, Error> {
        return service.request(.airlines)
            .map(BaseModel<Airlines>.self)
            .map { $0.response ?? [] }
            .eraseToAnyPublisher()
    }
}
