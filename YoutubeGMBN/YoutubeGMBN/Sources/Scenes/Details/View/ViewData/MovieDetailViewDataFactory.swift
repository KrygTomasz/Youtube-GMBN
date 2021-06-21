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
    
    static func create(movieDetails: MovieDetailsContainer?) -> MovieDetailViewData? {
        guard let movieDetails = movieDetails else { return nil }
        let date = movieDetails.date
        let dateString: String?
        if let date = date {
            dateString = dateFormatter.string(from: date)
        } else {
            dateString = nil
        }
        return MovieDetailViewData(title: movieDetails.title,
                                   description: movieDetails.description,
                                   imageName: movieDetails.imageThumbnail.url ?? "",
                                   duration: movieDetails.duration,
                                   date: dateString)
    }
}
