//
//  MoviesListViewModel.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import RxSwift

final class MoviesListViewModel {
    let useCase: MoviesListUseCase
    let disposeBag: DisposeBag = DisposeBag()
    
    init() {
        let service = MoviesNetworkService()
        useCase = MoviesListUseCase(moviesService: service)
        useCase.getMovies()
            .subscribe(onSuccess: { movies in
                print(movies)
            }, onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
    }
}
