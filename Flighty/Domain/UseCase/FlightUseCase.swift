//
//  FlightUseCase.swift
//  flighty
//
//  Created by SuperMove on 2022/11/16.
//

import RxSwift

protocol FlightUseCaseProtocol {
    func flights() -> Single<[Flight]>
}

final class FlightUseCase: FlightUseCaseProtocol {
    
    private let repository: FlightRepositoryInterface
    
    init(repository: FlightRepositoryInterface) {
        self.repository = repository
    }
    
    func flights() -> Single<[Flight]> {
        return repository.getFlights()
    }
}
