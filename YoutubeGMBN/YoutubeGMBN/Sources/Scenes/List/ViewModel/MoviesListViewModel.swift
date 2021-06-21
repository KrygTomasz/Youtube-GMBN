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
        fileprivate let selectedMovieRelay: PublishRelay<Movie> = .init()
        var selectedMovie: Observable<Movie> { return selectedMovieRelay.asObservable() }
    }
    
    private let useCase: MoviesListUseCaseProtocol
    private let disposeBag: DisposeBag = DisposeBag()
    private let eventsRelay: PublishRelay<Event> = .init()
    var events: Driver<Event> { return eventsRelay.asDriver(onErrorJustReturn: .hideLoading) }
    let input = Input()
    let output = Output()
    
    init(useCase: MoviesListUseCaseProtocol) {
        self.useCase = useCase
        setupBinding()
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
    
    private func setupBinding() {
        input.selectMovie
            .subscribe(onNext: { [weak self] indexPath in
                self?.selectMovie(at: indexPath)
            })
            .disposed(by: disposeBag)
    }
    
    private func selectMovie(at indexPath: IndexPath) {
        let index = indexPath.row
        let movies = output.dataRelay.value
        guard index < movies.count else { return }
        let movie = movies[index]
        output.selectedMovieRelay.accept(movie)
    }
}
