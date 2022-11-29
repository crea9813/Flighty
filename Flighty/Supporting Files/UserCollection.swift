//
//  UserCollection.swift
//  Flighty
//
//  Created by SuperMove on 2022/11/29.
//

import Foundation
import Combine

public class UserCollection: ObservableObject {
    
    // MARK: - Public Properties
    @Published var flightIDs: [String] = []
    
}
