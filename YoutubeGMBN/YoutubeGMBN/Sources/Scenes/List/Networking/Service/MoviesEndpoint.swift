//
//  MoviesEndpoint.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import GMBNNetworking

enum MoviesEndpoint {
    case allMovies
}

extension MoviesEndpoint: HTTPEndpoint {
    var path: String {
        switch self {
        case .allMovies:
            return "search"
        }
    }
    
    var httpHeaders: HTTPHeaders {
        return .init()
    }
    
    var httpQuery: HTTPQuery? {
        switch self {
        case .allMovies:
            return .init()
                .add(key: "channelId", value: YoutubeChannel.GMBN.id)
                .add(key: "maxResults", value: "50")
                .add(key: "order", value: "date")
                .add(key: "part", value: "snippet")
        }
    }
    
    var httpBody: HTTPBody? { return nil }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .allMovies:
            return .get
        }
    }
}
