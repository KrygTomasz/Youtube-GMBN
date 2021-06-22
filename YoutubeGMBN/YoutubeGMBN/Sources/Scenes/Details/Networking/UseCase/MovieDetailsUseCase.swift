//
//  MovieDetailsUseCaseProtocol.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import RxSwift

protocol MovieDetailsUseCaseProtocol {
    func getDetails(id: String) -> Single<MovieDetailsContainer?>
    func getComments(id: String) -> Single<[MovieComment]>
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
    
    func getComments(id: String) -> Single<[MovieComment]> {
        return moviesService.getComments(id: id)
            .map { MovieCommentsMapper.map(response: $0) }
    }
}
