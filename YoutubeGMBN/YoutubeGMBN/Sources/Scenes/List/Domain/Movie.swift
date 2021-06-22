//
//  Movie.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

struct MoviesContainer: Equatable {
    let movies: [Movie]
}

struct Movie: Equatable {
    let id: MovieId
    let snippet: MovieSnippet
}

struct MovieId: Equatable {
    let videoId: String
}

struct MovieSnippet: Equatable {
    let publishedAt: Date?
    let title: String
    let description: String
    let thumbnails: MovieThumbnailContainer
}

struct MovieThumbnailContainer: Equatable {
    let `default`: MovieThumbnail
    let high: MovieThumbnail
}

struct MovieThumbnail: Equatable {
    let url: String?
}
