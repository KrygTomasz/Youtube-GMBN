//
//  NetworkService.swift
//  GMBNNetworking
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Moya
import RxMoya
import RxSwift

final class NetworkService<Endpoint: TargetType> {
    let provider: MoyaProvider<Endpoint> = MoyaProvider<Endpoint>(plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))])
    
    func call<Response>(endpoint: Endpoint) -> Single<Response> where Response: Decodable {
        return provider.rx.request(endpoint)
            .flatMap { response in
                if HTTPResponseTypeMapper.map(statusCode: response.statusCode) == .success {
                    do {
                        let data = try JSONDecoder().decode(Response.self, from: response.data)
                        return .just(data)
                    } catch {
                        return .error(NetworkError.parsing)
                    }
                } else {
                    return .error(NetworkError.code(response.statusCode))
                }
            }
    }
}
