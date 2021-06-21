//
//  HTTPResponseTypeMapper.swift
//  GMBNNetworking
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

struct HTTPResponseTypeMapper {
    static func map(statusCode: Int) -> HTTPResponseType {
        switch statusCode {
        case 100...199:
            return .informational
        case 200...299:
            return .success
        case 300...399:
            return .redirection
        case 400...499:
            return .clientError
        case 500...599:
            return .serverError
        default:
            return .unknown
        }
    }
}
