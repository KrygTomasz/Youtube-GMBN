//
//  MovieCommentsMapper.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 22/06/2021.
//

import Foundation

struct MovieCommentsMapper {
    static func map(response: MovieCommentsContainerResponse?) -> [MovieComment] {
        guard let items = response?.items else { return [] }
        return items.map { item -> MovieComment in
            let comment = item.snippet?.topLevelComment?.snippet?.textDisplay ?? ""
            let author = item.snippet?.topLevelComment?.snippet?.authorDisplayName ?? ""
            return MovieComment(text: comment, author: author)
        }
    }
}
