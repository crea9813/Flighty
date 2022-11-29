//
//  API.swift
//  flighty
//
//  Created by SuperMove on 2022/11/16.
//

import Foundation
import Moya

enum API {
    case flights(_ param: FlightRequestModel? = nil)
    case schedules(param: ScheduleRequestModel)
}

extension API: TargetType {
    var baseURL: URL {
        Constant.API_URL
    }
    
    var path: String {
        switch self {
        case .flights: return "flights"
        case .schedules: return "schedules"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case let .flights(param):
            return param == nil ? .requestPlain : .requestParameters(parameters: try! param!.asDictionary(), encoding: URLEncoding.default)
        case let .schedules(param):
            return .requestParameters(parameters: try! param.asDictionary(), encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [
            :
        ]
    }
}


struct ScheduleRequestModel: ModelType {
    let dep_iata, dep_icao, arr_iata, arr_icao, airline_icao, airline_iata: String?
}

protocol ModelType: Codable { }

extension ModelType {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard var dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        dictionary["api_key"] = Constant.API_KEY
        return dictionary
    }
}
