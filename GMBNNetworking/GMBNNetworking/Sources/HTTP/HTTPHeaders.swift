//
//  HTTPHeaders.swift
//  GMBNNetworking
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

public class HTTPHeaders {
    var headers: [String: String] = [:]
    
    init() {
        self.add(common: .apiKey)
    }
    
    public func add(key: String, value: String) -> HTTPHeaders {
        headers[key] = value
        return self
    }
    
    @discardableResult public func add(common: CommonHeader) -> HTTPHeaders {
        return add(key: common.key, value: common.value)
    }
}
