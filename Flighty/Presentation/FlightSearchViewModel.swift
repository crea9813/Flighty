//
//  FlightSearchViewModel.swift
//  Flighty
//
//  Created by SuperMove on 2022/11/30.
//

import Foundation
import Combine

final class FlightSearchViewModel: ObservableObject {
 
    // MARK: - Public Properties
    @Published var query: String = ""
    @Published var results = [AirportAndAirline]()
    @Published var isLoading = false
    
    // MARK: - Private Properties
    
    private let useCase: FlightUseCaseProtocol!
    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    
    // MARK: - Initializer
    
    init(_ useCase: FlightUseCaseProtocol) {
        self.useCase = useCase
        
        $query.subscribe(on: DispatchQueue.global())
            .handleEvents(receiveOutput: { [weak self] _ in
                DispatchQueue.main.async {
                    self?.isLoading = true
                }
            })
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .filter { !$0.isEmpty }
            .map(searchAirportAndAirline(_:))
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    self.results = []
                }
            } receiveValue: { items in
                self.results = items
            }.store(in: &bag)
            
            
        
    }
    
    func searchAirportAndAirline(_ query: String) -> AnyPublisher<[AirportAndAirline], Error> {
        
        let airports = self.useCase.airports()
            .map { airports -> [AirportAndAirline] in
                return airports.map { AirportAndAirline(iataCode: $0.iataCode, icaoCode: $0.icaoCode, name: $0.name) }
            }
            .eraseToAnyPublisher()
        
        let airlines = self.useCase.airlines()
            .map { airlines -> [AirportAndAirline] in
                return airlines.map { AirportAndAirline(iataCode: $0.iataCode, icaoCode: $0.icaoCode, name: $0.name) }
            }
            .eraseToAnyPublisher()
        
        return airports.merge(with: airlines).eraseToAnyPublisher()
        
    }
}
