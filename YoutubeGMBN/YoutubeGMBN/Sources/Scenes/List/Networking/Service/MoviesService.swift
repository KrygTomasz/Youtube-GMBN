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
}

final class MoviesNetworkService: MoviesService {
    let networkService = NetworkService<MoviesEndpoint>()
    
    func getMovies() -> Single<MoviesContainerResponse> {
        return networkService.call(endpoint: .allMovies)
    }
}
