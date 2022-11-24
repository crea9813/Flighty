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
                    print()
                },
                receiveRequest: {_ in
                     print()
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
                
                throw Error(message: "Unknown Error", code: "unknown_error")
                
            } catch {
                let decodingError = Error(message: "Decoding Failed", code: "decoding_error")
                throw decodingError
            }
        }.mapError({ $0 as? Error ?? Error(message: "Unknown Error", code: "unknown_error")})
            .eraseToAnyPublisher()
    }
}
