//
//  MovieDetailsUseCaseTests.swift
//  YoutubeGMBNTests
//
//  Created by Tomasz Kryg on 22/06/2021.
//

import XCTest
import RxSwift
@testable import YoutubeGMBN

class MovieDetailsUseCaseTests: XCTestCase {
    var sut: MovieDetailsUseCase!
    var service: StubMoviesService!
    var disposeBag: DisposeBag = DisposeBag()
    
    override func setUp() {
        super.setUp()
        prepareSut()
    }
    
    func test_MovieDetailsUseCase_getDetails_returnsProperObject() {
        let expectedContainer: MovieDetailsContainer = StubMovieDetailsContainerBuilder()
            .set(\.title, "anyTitle")
            .set(\.date, nil)
            .set(\.description, "anyDescription")
            .set(\.duration, "2h 3m 49s")
            .set(\.thumbnail, .init(url: "https://www.anyurl.com"))
            .build()
        var returnedContainer: MovieDetailsContainer?
        service.movieDetails = .init(items: [.init(snippet: .init(publishedAt: nil,
                                                                  title: "",
                                                                  description: "",
                                                                  thumbnails: .init(default: nil,
                                                                                    high: .init(url: "https://www.anyurl.com")),
                                                                  localized: .init(title: "anyTitle",
                                                                                   description: "anyDescription")),
                                                   contentDetails: .init(duration: "PT2H3M49S"))])
        let exp = expectation(description: "Getting movie details")
        sut.getDetails(id: "anyId")
            .subscribe(onSuccess: { container in
                exp.fulfill()
                returnedContainer = container
            })
            .disposed(by: disposeBag)
        waitForExpectations(timeout: 0.5)
        XCTAssertEqual(expectedContainer, returnedContainer)
    }
    
    func test_MovieDetailsUseCase_getComments_returnsProperObject() {
        let expectedComments: [MovieComment] = [
            .init(text: "anyText0", author: "anyAuthor0"),
            .init(text: "anyText1", author: "anyAuthor1"),
            .init(text: "anyText2", author: "anyAuthor2"),
            .init(text: "anyText3", author: "anyAuthor3")
        ]
        var returnedComments: [MovieComment]?
        service.comments = .init(items: [
            StubMovieCommentResponseBuilder().set(\.text, "anyText0").set(\.author, "anyAuthor0").build(),
            StubMovieCommentResponseBuilder().set(\.text, "anyText1").set(\.author, "anyAuthor1").build(),
            StubMovieCommentResponseBuilder().set(\.text, "anyText2").set(\.author, "anyAuthor2").build(),
            StubMovieCommentResponseBuilder().set(\.text, "anyText3").set(\.author, "anyAuthor3").build(),
        ])
        let exp = expectation(description: "Getting comments")
        sut.getComments(id: "anyId")
            .subscribe(onSuccess: { comments in
                exp.fulfill()
                returnedComments = comments
            })
            .disposed(by: disposeBag)
        waitForExpectations(timeout: 0.5)
        XCTAssertEqual(expectedComments, returnedComments)
    }
    
    func prepareSut() {
        service = StubMoviesService()
        sut = MovieDetailsUseCase(moviesService: service)
        disposeBag = DisposeBag()
    }
}
