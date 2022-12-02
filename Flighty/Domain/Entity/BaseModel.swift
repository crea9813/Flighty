//
//  BaseModel.swift
//  flighty
//
//  Created by SuperMove on 2022/11/16.
//

import Foundation

struct BaseModel<T : Decodable>: Decodable {
    var error: Error?
    var response: T?
}

struct Error: Decodable, LocalizedError {
    let message, code: String
}
