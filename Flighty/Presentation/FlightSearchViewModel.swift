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
            .map { [unowned self] in return self.useCase.search($0) }
            .switchToLatest()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("\(error.code): \(error.message)")
                    self.results = []
                }
            } receiveValue: { [unowned self] items in
                self.isLoading = false
                self.results = items
            }.store(in: &bag)
    }
}
