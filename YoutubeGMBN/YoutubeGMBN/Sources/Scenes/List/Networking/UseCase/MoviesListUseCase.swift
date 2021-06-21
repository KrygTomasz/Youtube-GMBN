//
//  MoviesListUseCase.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import RxSwift

protocol MoviesListUseCaseProtocol {
    func getMovies() -> Single<MoviesContainer>
}

struct MoviesListUseCase: MoviesListUseCaseProtocol {
    let moviesService: MoviesService
    
    init(moviesService: MoviesService) {
        self.moviesService = moviesService
    }
    
    func getMovies() -> Single<MoviesContainer> {
        return moviesService.getMovies()
            .map { MovieMapper.map(response: $0) }
    }
}
