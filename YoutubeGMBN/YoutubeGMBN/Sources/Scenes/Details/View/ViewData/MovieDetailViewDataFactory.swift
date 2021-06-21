//
//  MovieDetailViewDataFactory.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

struct MovieDetailViewDataFactory {
    private static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        formatter.locale = .current
        formatter.timeZone = .current
        return formatter
    }
    
    static func create(movie: Movie) -> MovieDetailViewData {
        let date = movie.snippet.publishedAt
        let dateString: String?
        if let date = date {
            dateString = dateFormatter.string(from: date)
        } else {
            dateString = nil
        }
        return MovieDetailViewData(title: movie.snippet.title,
                                             description: movie.snippet.description,
                                             imageName: movie.snippet.thumbnails.high.url ?? "",
                                             duration: "",
                                             date: dateString)
    }
}
