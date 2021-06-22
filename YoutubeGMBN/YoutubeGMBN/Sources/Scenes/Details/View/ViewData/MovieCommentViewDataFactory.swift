//
//  MovieCommentViewDataFactory.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 22/06/2021.
//

import Foundation

struct MovieCommentViewDataFactory {
    static func create(_ comments: [MovieComment]) -> [MovieCommentViewData] {
        return comments.map { MovieCommentViewData(text: $0.text, author: $0.author) }
    }
}
