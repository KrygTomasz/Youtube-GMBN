//
//  HTTPQuery.swift
//  GMBNNetworking
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

public class HTTPQuery {
    var query: [String: String] = [:]
    
    public init() {
        self.add(common: .apiKey)
    }
    
    public func add(key: String, value: String) -> HTTPQuery {
        query[key] = value
        return self
    }
    
    @discardableResult public func add(common: CommonQuery) -> HTTPQuery {
        return add(key: common.key, value: common.value)
    }
}
