//
//  CommonQuery.swift
//  GMBNNetworking
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

public enum CommonQuery {
    case apiKey
    
    var key: String {
        switch self {
        case .apiKey:
            return "key"
        }
    }
    
    var value: String {
        switch self {
        case .apiKey:
            return YoutubeAPIKeyProvider().key
        }
    }
}
