//
//  MovieResponse.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

struct MoviesContainerResponse: Decodable {
    let items: [MovieResponse]?
}

struct MovieResponse: Decodable {
    let id: MovieIdResponse?
    let snippet: MovieSnippetResponse?
}

struct MovieIdResponse: Decodable {
    let videoId: String?
}

struct MovieSnippetResponse: Decodable {
    let publishedAt: String?
    let title: String?
    let description: String?
    let thumbnails: MovieThumbnailContainerResponse?
}

struct MovieThumbnailContainerResponse: Decodable {
    let `default`: MovieThumbnailResponse?
}

struct MovieThumbnailResponse: Decodable {
    let url: String?
}
