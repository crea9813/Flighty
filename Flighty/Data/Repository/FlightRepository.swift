//
//  FlightRepository.swift
//  flighty
//
//  Created by SuperMove on 2022/11/16.
//

import RxSwift

final class FlightRepository: FlightRepositoryInterface {
    
    private let service: Networking<API>
    
    init(service: Networking<API>) {
        self.service = service
    }
    
    func getFlights() -> Single<[Flight]> {
        return service.request(.flights)
            .map(BaseModel<[Flight]>.self)
            .map { $0.response ?? [] }
    }
}
