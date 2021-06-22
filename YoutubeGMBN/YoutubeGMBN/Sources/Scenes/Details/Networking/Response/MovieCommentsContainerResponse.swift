//
//  MovieCommentsContainerResponse.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 22/06/2021.
//

import Foundation

struct MovieCommentsContainerResponse: Decodable {
    let items: [MovieCommentResponse]?
}

struct MovieCommentResponse: Decodable {
    let snippet: MovieCommentSnippetResponse?
}

struct MovieCommentSnippetResponse: Decodable {
    let topLevelComment: MovieTopLevelCommentResponse?
}

struct MovieTopLevelCommentResponse: Decodable {
    let snippet: MovieCommentDetailSnippetResponse?
}

struct MovieCommentDetailSnippetResponse: Decodable {
    let textDisplay: String?
    let authorDisplayName: String?
}
