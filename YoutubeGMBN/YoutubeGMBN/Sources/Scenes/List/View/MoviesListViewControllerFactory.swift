//
//  MoviesListViewControllerFactory.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

struct MoviesListViewControllerFactory {
    static func create() -> MoviesListViewController {
        let viewModel = MoviesListViewModel()
        return MoviesListViewController(viewModel: viewModel)
    }
}
