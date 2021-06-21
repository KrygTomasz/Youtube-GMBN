//
//  HTTPEndpoint.swift
//  GMBNNetworking
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Moya

public protocol HTTPEndpoint: TargetType {
    var httpHeaders: HTTPHeaders { get }
    var httpQuery: HTTPQuery? { get }
    var httpBody: HTTPBody? { get }
    var httpMethod: HTTPMethod { get }
}

public typealias HTTPMethod = Moya.Method

extension HTTPEndpoint {
    public var task: Task {
        switch (httpQuery, httpBody) {
        case (nil, nil):
            return .requestPlain
        case (_, nil):
            return .requestParameters(parameters: httpQuery?.query ?? [:], encoding: URLEncoding.queryString)
        case (nil, _):
            return .requestParameters(parameters: httpBody?.body ?? [:], encoding: URLEncoding.default)
        default:
            return .requestCompositeParameters(bodyParameters: httpBody?.body ?? [:], bodyEncoding: URLEncoding.httpBody, urlParameters: httpQuery?.query ?? [:])
        }
    }
    
    public var baseURL: URL { return URL(string: "")! }
    public var method: Moya.Method { return httpMethod }
    public var sampleData: Data { return Data() }
    public var headers: [String : String]? { return httpHeaders.headers }
}
