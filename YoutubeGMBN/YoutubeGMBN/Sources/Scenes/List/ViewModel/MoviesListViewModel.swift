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
    
    enum Event {
        case showLoading
        case hideLoading
    }
    
    struct Input {
        let selectMovie: PublishRelay<IndexPath> = .init()
    }
    
    struct Output {
        fileprivate let dataRelay: BehaviorRelay<[Movie]> = .init(value: [])
        var viewData: Driver<[MovieViewData]> { return dataRelay.asDriver().map { $0.map { MovieViewDataFactory.create($0) } } }
    }
    
    private let useCase: MoviesListUseCase
    private let disposeBag: DisposeBag = DisposeBag()
    private let eventsRelay: PublishRelay<Event> = .init()
    var events: Driver<Event> { return eventsRelay.asDriver(onErrorJustReturn: .hideLoading) }
    let input = Input()
    let output = Output()
    
    init() {
        let service = MoviesNetworkService()
        useCase = MoviesListUseCase(moviesService: service)
        refresh()
    }
    
    func refresh() {
        eventsRelay.accept(.showLoading)
        useCase.getMovies()
            .subscribe(onSuccess: { [weak self] movies in
                self?.eventsRelay.accept(.hideLoading)
                self?.output.dataRelay.accept(movies.movies)
            }, onError: { [weak self] error in
                self?.eventsRelay.accept(.hideLoading)
            })
            .disposed(by: disposeBag)
    }
}
