//
//  MainViewModel.swift
//  Flighty
//
//  Created by SuperMove on 2022/11/28.
//

import Foundation
import Combine
import SwiftUI

enum FlightViewState {
    case my
    case others
    case search
}

final class MainViewModel: ObservableObject {
    // MARK: - Public Properties
    @Published public var searchText = ""
    @Published public var isMyFlight = false
    @Published public var isLoading = false
    @Published public var viewState: FlightViewState = .search
    
    @Published public var flights: Flights = []
    
    // MARK: - Private Properties
    
    private let useCase: FlightUseCaseProtocol!
    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    private let userCollection: UserCollection
    
    // MARK: - Initialization
    
    init(_ useCase: FlightUseCaseProtocol, userCollection: UserCollection) {
        self.useCase = useCase
        self.userCollection = userCollection
    }
    
    // MARK: - Public Methods
    
    func loadFlights() {
        useCase.flights()
            .sink { completion in
                switch completion {
                case .finished: break
                case .failure(_):
                    self.flights = []
                }
            } receiveValue: { flights in
                self.flights = flights
            }.store(in: &bag)
    }
}
