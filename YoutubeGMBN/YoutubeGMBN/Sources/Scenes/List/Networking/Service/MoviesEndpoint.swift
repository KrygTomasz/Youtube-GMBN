//
//  MoviesEndpoint.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import GMBNNetworking

enum MoviesEndpoint {
    case allMovies
    case movieDetails(id: String)
    case comments(id: String)
}

extension MoviesEndpoint: HTTPEndpoint {
    var path: String {
        switch self {
        case .allMovies:
            return "search"
        case .movieDetails:
            return "videos"
        case .comments:
            return "commentThreads"
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
        case .movieDetails(let id):
            return .init()
                .add(key: "id", value: id)
                .add(key: "part", value: "snippet, contentDetails")
        case .comments(let id):
            return .init()
                .add(key: "videoId", value: id)
                .add(key: "part", value: "snippet")
                .add(key: "textFormat", value: "plainText")
                .add(key: "maxResults", value: "100")
        }
    }
    
    var httpBody: HTTPBody? { return nil }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .allMovies, .movieDetails, .comments:
            return .get
        }
    }
}
