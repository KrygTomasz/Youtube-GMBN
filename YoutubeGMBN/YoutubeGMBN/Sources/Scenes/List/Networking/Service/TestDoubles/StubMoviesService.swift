//
//  StubMoviesService.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 22/06/2021.
//

import RxSwift

class StubMoviesService: MoviesService {
    var movies: MoviesContainerResponse = .init(items: [])
    var movieDetails: MovieDetailsContainerResponse = .init(items: [])
    var comments: MovieCommentsContainerResponse = .init(items: [])

    func getMovies() -> Single<MoviesContainerResponse> {
        return .just(movies)
    }
    
    func getMovieDetails(id: String) -> Single<MovieDetailsContainerResponse> {
        return .just(movieDetails)
    }
    
    func getComments(id: String) -> Single<MovieCommentsContainerResponse> {
        return .just(comments)
    }
}
