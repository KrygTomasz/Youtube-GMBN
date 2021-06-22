//
//  StubMoviesContainerBuilder.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 22/06/2021.
//

import Foundation

struct StubMoviesContainerBuilder: Builder {
    var id: MovieId = .init(videoId: "")
    var publishedAt: Date? = nil
    var title: String = ""
    var description: String = ""
    var defaultThumbnail: MovieThumbnail = .init(url: nil)
    var highThumbnail: MovieThumbnail = .init(url: nil)

    func build() -> MoviesContainer {
        return MoviesContainer(movies: [.init(id: id,
                                              snippet: .init(publishedAt: publishedAt,
                                                             title: title,
                                                             description: description,
                                                             thumbnails: .init(default: defaultThumbnail,
                                                                               high: highThumbnail)))])
    }
}
