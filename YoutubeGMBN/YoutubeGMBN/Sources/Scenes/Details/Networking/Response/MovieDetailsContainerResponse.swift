//
//  MovieDetailsContainerResponse.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

struct MovieDetailsContainerResponse: Decodable {
    let items: [MovieDetailsResponse]
}

struct MovieDetailsResponse: Decodable {
    let snippet: MovieSnippetResponse?
    let contentDetails: MovieContentDetailsResponse?
}

struct MovieContentDetailsResponse: Decodable {
    let duration: String?
}
