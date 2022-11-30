//
//  FlightUseCase.swift
//  flighty
//
//  Created by SuperMove on 2022/11/16.
//

import Combine

protocol FlightUseCaseProtocol {
    func flights() -> AnyPublisher<Flights, Error>
    func flight(_ flightID: String) -> AnyPublisher<Flight, Error>
    func airports() -> AnyPublisher<Airports, Error>
    func airlines() -> AnyPublisher<Airlines, Error>
}


final class FlightUseCase: FlightUseCaseProtocol {
    
    private let repository: FlightRepositoryInterface
    
    init(repository: FlightRepositoryInterface) {
        self.repository = repository
    }
    
    func flights() -> AnyPublisher<Flights, Error> {
        return repository.getFlights()
    }
    
    func flight(_ flightID: String) -> AnyPublisher<Flight, Error> {
        return repository.getFlight(flightID)
    }
    
    func airports() -> AnyPublisher<Airports, Error> {
        return repository.getAirports()
    }
    
    func airlines() -> AnyPublisher<Airlines, Error> {
        return repository.getAirlines()
    }
}
