//
//  Builder.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 22/06/2021.
//

import Foundation

public protocol Builder {
    associatedtype BuildItem
    func build() -> BuildItem
}

extension Builder {
    public func set<T>(_ keyPath: WritableKeyPath<Self, T>, _ value: T) -> Self {
        var builder = self
        builder[keyPath: keyPath] = value
        return builder
    }
}
