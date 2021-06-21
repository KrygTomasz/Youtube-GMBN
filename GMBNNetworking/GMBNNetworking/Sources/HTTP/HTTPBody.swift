//
//  HTTPBody.swift
//  GMBNNetworking
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

public class HTTPBody {
    var body: [String: String] = [:]
    
    public func add(key: String, value: String) -> HTTPBody {
        body[key] = value
        return self
    }
}
