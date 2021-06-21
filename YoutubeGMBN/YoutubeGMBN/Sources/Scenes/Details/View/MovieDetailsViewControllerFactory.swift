//
//  MovieDetailsViewControllerFactory.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

struct MovieDetailsViewControllerFactory {
    static func create(movie: Movie) -> MovieDetailsViewController {
        let viewModel = MovieDetailsViewModel(movie: movie)
        return MovieDetailsViewController(viewModel: viewModel)
    }
}
