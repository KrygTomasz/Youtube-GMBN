//
//  String+Localized.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Foundation

public extension String {
    var localized: String { NSLocalizedString(self, comment: "") }
}
