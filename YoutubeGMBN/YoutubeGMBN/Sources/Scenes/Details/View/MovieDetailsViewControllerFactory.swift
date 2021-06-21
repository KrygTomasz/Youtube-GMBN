//
//  MovieDetailsViewControllerFactory.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

struct MovieDetailsViewControllerFactory {
    static func create(movie: Movie) -> MovieDetailsViewController {
        let service = MoviesNetworkService()
        let useCase = MovieDetailsUseCase(moviesService: service)
        let viewModel = MovieDetailsViewModel(movie: movie, useCase: useCase)
        return MovieDetailsViewController(viewModel: viewModel)
    }
}
