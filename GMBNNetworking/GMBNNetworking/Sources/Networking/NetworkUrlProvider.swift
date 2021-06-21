//
//  NetworkUrlProvider.swift
//  GMBNNetworking
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

struct NetworkUrlProvider {
    var baseUrl: URL {
        return URL(string: "https://youtube.googleapis.com/youtube/v3")!
    }
}
