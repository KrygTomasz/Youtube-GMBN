//
//  MovieMapper.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

struct MovieMapper {
    private static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return formatter
    }
    
    static func map(response: MoviesContainerResponse?) -> MoviesContainer {
        guard let items = response?.items else { return .init(movies: []) }
        let movies = items.compactMap { movie -> Movie? in
            guard let videoId = movie.id?.videoId else { return nil }
            let publishedAt = movie.snippet?.publishedAt ?? ""
            let publishDate = dateFormatter.date(from: publishedAt)
            let title = movie.snippet?.title ?? ""
            let description = movie.snippet?.description ?? ""
            let defaultThumbnailUrl = movie.snippet?.thumbnails?.default?.url ?? ""
            let highThumbnailUrl = movie.snippet?.thumbnails?.high?.url ?? ""
            return Movie(id: .init(videoId: videoId),
                         snippet: .init(publishedAt: publishDate,
                                        title: title,
                                        description: description,
                                        thumbnails: .init(default: .init(url: defaultThumbnailUrl),
                                                          high: .init(url: highThumbnailUrl))))
        }
        return .init(movies: movies)
    }
}
