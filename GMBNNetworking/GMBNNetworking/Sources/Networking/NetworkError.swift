//
//  NetworkError.swift
//  GMBNNetworking
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

public enum NetworkError: Error {
    case parsing
    case code(Int)
}
