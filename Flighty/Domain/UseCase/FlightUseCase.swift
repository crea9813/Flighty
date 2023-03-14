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
    func search(_ query: String) -> AnyPublisher<[AirportAndAirline], Error>
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
    
    func search(_ query: String) -> AnyPublisher<[AirportAndAirline], Error> {
        let airports = repository.getAirports()
            .map { airports -> [AirportAndAirline] in
                return airports.map { AirportAndAirline(iataCode: $0.iataCode ?? "", icaoCode: $0.icaoCode ?? "", name: $0.name) }
            }
            
//        let airlines = repository.getAirlines()
//            .map { airlines -> [AirportAndAirline] in
//                return airlines.map { AirportAndAirline(iataCode: $0.iataCode ?? "", icaoCode: $0.icaoCode ?? "", name: $0.name) }
//            }
            
        return airports.eraseToAnyPublisher()
    }

}
