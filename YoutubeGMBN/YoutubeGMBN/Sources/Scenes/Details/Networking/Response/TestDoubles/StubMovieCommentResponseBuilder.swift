//
//  StubMovieCommentsContainerResponseBuilder.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 22/06/2021.
//

import Foundation

struct StubMovieCommentResponseBuilder: Builder {
    var text: String?
    var author: String?
    
    func build() -> MovieCommentResponse {
        return .init(snippet: .init(topLevelComment: .init(snippet: .init(textDisplay: text, authorDisplayName: author))))
    }
}
