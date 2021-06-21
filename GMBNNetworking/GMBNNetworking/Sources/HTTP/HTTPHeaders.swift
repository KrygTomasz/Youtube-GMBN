//
//  HTTPHeaders.swift
//  GMBNNetworking
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

public class HTTPHeaders {
    var headers: [String: String] = [:]
    
    public func add(key: String, value: String) -> HTTPHeaders {
        headers[key] = value
        return self
    }
}
