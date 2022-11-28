//
//  FlightUseCase.swift
//  flighty
//
//  Created by SuperMove on 2022/11/16.
//

import Combine

protocol FlightUseCaseProtocol {
    func flights() -> AnyPublisher<Flights, Error>
}

final class FlightUseCase: FlightUseCaseProtocol {
    
    private let repository: FlightRepositoryInterface
    
    init(repository: FlightRepositoryInterface) {
        self.repository = repository
    }
    
    func flights() -> AnyPublisher<Flights, Error> {
        return repository.getFlights()
    }
}
