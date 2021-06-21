//
//  MovieDetailsViewModel.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import RxSwift
import RxCocoa

final class MovieDetailsViewModel {
    struct Output {
        fileprivate let viewDataRelay: BehaviorRelay<MovieDetailViewData?> = .init(value: nil)
        var viewData: Driver<MovieDetailViewData?> { return viewDataRelay.asDriver() }
    }
    
    private let disposeBag: DisposeBag = DisposeBag()
    private let useCase: MovieDetailsUseCaseProtocol
    private let movie: Movie
    let output: Output
    
    init(movie: Movie, useCase: MovieDetailsUseCaseProtocol) {
        self.movie = movie
        self.output = Output()
        self.useCase = useCase
        refresh()
    }
    
    func refresh() {
        useCase.getDetails(id: movie.id.videoId)
            .subscribe(onSuccess: { [weak self] movieDetails in
                let viewData = MovieDetailViewDataFactory.create(movieDetails: movieDetails)
                self?.output.viewDataRelay.accept(viewData)
            }, onError: { _ in
                // TODO: handle error
            })
            .disposed(by: disposeBag)
    }
}
