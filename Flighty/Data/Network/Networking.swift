//
//  Networking.swift
//  flighty
//
//  Created by SuperMove on 2022/11/16.
//


import Moya
import Combine
import CombineMoya
import Foundation

final class Networking<Target: TargetType>: MoyaProvider<Target> {
    
    init(plugins: [PluginType] = [/*NetworkLoggerPlugin()*/]) {
        let session = MoyaProvider<Target>.defaultAlamofireSession()
        session.sessionConfiguration.timeoutIntervalForRequest = 10
        session.sessionConfiguration.timeoutIntervalForResource = 10
        super.init(session: session, plugins: plugins)
    }
    
    func request(
        _ target: Target,
        _ timeout : Int = 8,
        file: StaticString = #file,
        function: StaticString = #function,
        line: UInt = #line
    ) -> AnyPublisher<Response, Error> {
        let requestString = "\(target.method.rawValue) \(target.path)"
        
        return self.requestPublisher(target)
            .mapCustomError()
            .handleEvents(
                receiveOutput: { output in
                    print("SUCCESS: \(requestString)")
                },
                receiveRequest: { _ in
                     print("REQUEST: \(requestString)")
                 }
            ).eraseToAnyPublisher()
    }
}

extension AnyPublisher where Output == Response, Failure == MoyaError {
    func mapCustomError() -> AnyPublisher<Response, Error> {
        return self.tryMap { response -> Response in
            do {
                let decoded = try JSONDecoder().decode(BaseModel<AnyDecodable>.self, from: response.data)
                
                if let error = decoded.error { throw error }
                
                return response
            } catch {
                let decodingError = Error(message: "Decoding Failed", code: "decoding_error")
                throw decodingError
            }
        }.mapError({ $0 as? Error ?? Error(message: "Unknown Error", code: "unknown_error")})
            .eraseToAnyPublisher()
    }
}

extension AnyPublisher where Output == Response, Failure == Error {
    func map<D: Decodable>(_ type: D.Type, atKeyPath keyPath: String? = nil, using decoder: JSONDecoder = JSONDecoder(), failsOnEmptyData: Bool = true) -> AnyPublisher<D, Error> {
        return unwrapThrowable { response in
            try response.map(type, atKeyPath: keyPath, using: decoder, failsOnEmptyData: failsOnEmptyData)
        }
    }
    
    private func unwrapThrowable<T>(throwable: @escaping (Output) throws -> T) -> AnyPublisher<T, Error> {
        self.tryMap { element in
            try throwable(element)
        }
        .mapError { error -> Error in
            if let error = error as? Error {
                return error
            } else {
                return Error(message: "Unknown Error", code: "unknown_error")
            }
        }
        .eraseToAnyPublisher()
    }
}
