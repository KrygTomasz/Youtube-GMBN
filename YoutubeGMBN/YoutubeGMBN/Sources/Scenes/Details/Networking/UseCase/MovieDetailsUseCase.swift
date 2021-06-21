//
//  MovieDetailsUseCaseProtocol.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import RxSwift

protocol MovieDetailsUseCaseProtocol {
    func getDetails(id: String) -> Single<MovieDetailsContainer?>
}

struct MovieDetailsUseCase: MovieDetailsUseCaseProtocol {
    let moviesService: MoviesService
    
    init(moviesService: MoviesService) {
        self.moviesService = moviesService
    }
    
    func getDetails(id: String) -> Single<MovieDetailsContainer?> {
        return moviesService.getMovieDetails(id: id)
            .map { MovieDetailsMapper.map(response: $0) }
    }
}
