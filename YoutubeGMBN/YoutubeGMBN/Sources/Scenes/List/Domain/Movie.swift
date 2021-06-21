//
//  Movie.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

struct MoviesContainer {
    let movies: [Movie]
}

struct Movie {
    let id: MovieId
    let snippet: MovieSnippet
}

struct MovieId {
    let videoId: String
}

struct MovieSnippet {
    let publishedAt: Date?
    let title: String
    let description: String
    let thumbnails: MovieThumbnailContainer
}

struct MovieThumbnailContainer {
    let `default`: MovieThumbnail
}

struct MovieThumbnail {
    let url: String?
}
