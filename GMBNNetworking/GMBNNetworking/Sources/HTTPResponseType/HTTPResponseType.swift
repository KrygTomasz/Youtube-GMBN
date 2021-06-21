//
//  HTTPResponseType.swift
//  GMBNNetworking
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

enum HTTPResponseType {
    case informational
    case success
    case redirection
    case clientError
    case serverError
    case unknown
}
