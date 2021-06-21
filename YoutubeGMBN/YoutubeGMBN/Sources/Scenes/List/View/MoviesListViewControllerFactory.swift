//
//  MoviesListViewControllerFactory.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

struct MoviesListViewControllerFactory {
    static func create() -> MoviesListViewController {
        let service = MoviesNetworkService()
        let useCase = MoviesListUseCase(moviesService: service)
        let viewModel = MoviesListViewModel(useCase: useCase)
        return MoviesListViewController(viewModel: viewModel)
    }
}
