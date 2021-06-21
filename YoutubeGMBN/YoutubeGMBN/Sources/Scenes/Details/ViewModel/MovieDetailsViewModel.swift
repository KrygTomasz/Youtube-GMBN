//
//  MovieDetailsViewModel.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

final class MovieDetailsViewModel {
    struct Output {
        let viewData: MovieDetailViewData
    }
    
    private let movie: Movie
    let output: Output
    
    init(movie: Movie) {
        self.movie = movie
        self.output = Output(viewData: MovieDetailViewDataFactory.create(movie: movie))
    }
}
