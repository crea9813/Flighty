//
//  FlightyApp.swift
//  Flighty
//
//  Created by SuperMove on 2022/11/17.
//

import SwiftUI

@main
struct FlightyApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel(FlightUseCase(repository: FlightRepository(service: Networking<API>())), userCollection: UserCollection()))
        }
    }
}
