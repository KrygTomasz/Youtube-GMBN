//
//  MoviesListUseCaseTests.swift
//  YoutubeGMBNTests
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import XCTest
import RxSwift
@testable import YoutubeGMBN

class MoviesListUseCaseTests: XCTestCase {
    var sut: MoviesListUseCase!
    var service: StubMoviesService!
    var disposeBag: DisposeBag = DisposeBag()
    
    override func setUp() {
        super.setUp()
        prepareSut()
    }
    
    func test_MoviesListUseCase_getMovies_returnsProperObject() {
        let expectedContainer: MoviesContainer = StubMoviesContainerBuilder()
            .set(\.title, "anyTitle")
            .set(\.publishedAt, nil)
            .set(\.description, "anyDescription")
            .set(\.id, .init(videoId: "videoId"))
            .set(\.defaultThumbnail, .init(url: "https://www.anyurl.com"))
            .set(\.highThumbnail, .init(url: "https://www.anyurlhigh.com"))
            .build()
        var returnedContainer: MoviesContainer?
        service.movies = .init(items: [.init(id: .init(videoId: "videoId"),
                                             snippet: .init(publishedAt: nil,
                                                            title: "anyTitle",
                                                            description: "anyDescription",
                                                            thumbnails: .init(default: .init(url: "https://www.anyurl.com"),
                                                                              high: .init(url: "https://www.anyurlhigh.com")),
                                                            localized: nil))])
        let exp = expectation(description: "Getting movies")
        sut.getMovies()
            .subscribe(onSuccess: { container in
                exp.fulfill()
                returnedContainer = container
            })
            .disposed(by: disposeBag)
        waitForExpectations(timeout: 0.5)
        XCTAssertEqual(expectedContainer, returnedContainer)
    }
    
    func prepareSut() {
        service = StubMoviesService()
        sut = MoviesListUseCase(moviesService: service)
        disposeBag = DisposeBag()
    }
}
