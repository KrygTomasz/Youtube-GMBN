//
//  StubMovieDetailsContainerBuilder.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 22/06/2021.
//

import Foundation

struct StubMovieDetailsContainerBuilder: Builder {
    var date: Date? = nil
    var title: String = ""
    var description: String = ""
    var duration: String = ""
    var thumbnail: MovieThumbnail = .init(url: nil)

    func build() -> MovieDetailsContainer {
        return MovieDetailsContainer(title: title,
                                     description: description,
                                     imageThumbnail: thumbnail,
                                     duration: duration,
                                     date: date)
    }
}
