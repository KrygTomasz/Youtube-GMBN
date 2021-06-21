//
//  MoviesListViewModel.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import RxSwift
import RxCocoa
import UIKit

final class MoviesListViewModel {
    
    struct Input {
        let selectMovie: PublishRelay<IndexPath> = .init()
    }
    
    struct Output {
        fileprivate let dataRelay: BehaviorRelay<[Movie]> = .init(value: [])
        var viewData: Driver<[MovieViewData]> { return dataRelay.asDriver().map { $0.map { MovieViewDataFactory.create($0) } } }
    }
    
    private let useCase: MoviesListUseCase
    private let disposeBag: DisposeBag = DisposeBag()
    let output = Output()
    
    init() {
        let service = MoviesNetworkService()
        useCase = MoviesListUseCase(moviesService: service)
        useCase.getMovies()
            .subscribe(onSuccess: { [weak self] movies in
                self?.output.dataRelay.accept(movies.movies)
            }, onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
    }
}
