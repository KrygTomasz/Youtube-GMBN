//
//  MovieDetailsViewModel.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import RxSwift
import RxCocoa
import UIKit

final class MovieDetailsViewModel {
    struct Output {
        fileprivate let viewDataRelay: BehaviorRelay<MovieDetailViewData?> = .init(value: nil)
        var viewData: Driver<MovieDetailViewData?> { return viewDataRelay.asDriver() }
        var currentViewData: MovieDetailViewData? { return viewDataRelay.value }
        
        fileprivate let commentViewDataRelay: BehaviorRelay<[MovieCommentViewData]> = .init(value: [])
        var commentViewData: Driver<[MovieCommentViewData]> { return commentViewDataRelay.asDriver() }
        var currentCommentViewData: [MovieCommentViewData] { return commentViewDataRelay.value }
        
        func getCommentViewData(at indexPath: IndexPath) -> MovieCommentViewData? {
            let index = indexPath.row
            guard index < currentCommentViewData.count else { return nil }
            return currentCommentViewData[index]
        }
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
        
        useCase.getComments(id: movie.id.videoId)
            .subscribe(onSuccess: { [weak self] comments in
                let viewData = MovieCommentViewDataFactory.create(comments)
                self?.output.commentViewDataRelay.accept(viewData)
            }, onError: { _ in
                // TODO: handle error
            })
            .disposed(by: disposeBag)
    }
}
