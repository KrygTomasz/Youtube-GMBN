//
//  MoviesService.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import RxSwift
import GMBNNetworking

protocol MoviesService {
    func getMovies() -> Single<MoviesContainerResponse>
    func getMovieDetails(id: String) -> Single<MovieDetailsContainerResponse>
    func getComments(id: String) -> Single<MovieCommentsContainerResponse>
}

final class MoviesNetworkService: MoviesService {
    let networkService = NetworkService<MoviesEndpoint>()
    
    func getMovies() -> Single<MoviesContainerResponse> {
        return networkService.call(endpoint: .allMovies)
    }
    
    func getMovieDetails(id: String) -> Single<MovieDetailsContainerResponse> {
        return networkService.call(endpoint: .movieDetails(id: id))
    }
    
    func getComments(id: String) -> Single<MovieCommentsContainerResponse> {
        return networkService.call(endpoint: .comments(id: id))
    }
}
