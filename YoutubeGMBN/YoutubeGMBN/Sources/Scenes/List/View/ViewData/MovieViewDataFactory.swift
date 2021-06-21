//
//  MovieViewDataFactory.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import UIKit

struct MovieViewDataFactory {
    static func create(_ movie: Movie) -> MovieViewData {
        return .init(title: movie.snippet.title, image: nil)
    }
}
