//
//  BaseModel.swift
//  flighty
//
//  Created by SuperMove on 2022/11/16.
//

import Foundation

class BaseModel<T : Decodable>: Decodable {
    var error: Error?
    var response: T?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        response = try? container.decode(T.self, forKey: .response)
        error = try? container.decode(Error.self, forKey: .error)
    }
    
    private enum CodingKeys : String, CodingKey {
        case error, response
    }
}

struct Error: Decodable, LocalizedError {
    let message, code: String
}
