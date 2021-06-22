//
//  MovieDetailsContainer.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

struct MovieDetailsContainer: Equatable {
    let title: String
    let description: String
    let imageThumbnail: MovieThumbnail
    let duration: String
    let date: Date?
}
