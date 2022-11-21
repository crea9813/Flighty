//
//  FlightRepositoryInterface.swift
//  flighty
//
//  Created by SuperMove on 2022/11/16.
//

import RxSwift

protocol FlightRepositoryInterface {
    func getFlights() -> Single<[Flight]>
}
