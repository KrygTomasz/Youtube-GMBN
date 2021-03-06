//
//  MovieDetailsMapper.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

struct MovieDetailsMapper {
    private static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return formatter
    }
    
    static func map(response: MovieDetailsContainerResponse?) -> MovieDetailsContainer? {
        guard let item = response?.items.first else { return nil }
        let title = item.snippet?.localized?.title ?? ""
        let description = item.snippet?.localized?.description ?? ""
        let imageUrl = item.snippet?.thumbnails?.high?.url
        let duration = parseDuration(item.contentDetails?.duration)
        let date = dateFormatter.date(from: item.snippet?.publishedAt ?? "")
        return .init(title: title, description: description, imageThumbnail: .init(url: imageUrl), duration: duration, date: date)
    }
    
    private static func parseDuration(_ duration: String?) -> String {
        let duration = (duration ?? "").replacingOccurrences(of: "PT", with: "").lowercased()
        return duration.map { char -> String in
            return !char.isNumber ? "\(char) " : "\(char)"
        }.joined().trimmingCharacters(in: .whitespaces)
    }
}
