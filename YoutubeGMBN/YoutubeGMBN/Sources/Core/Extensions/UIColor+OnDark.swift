//
//  UIColor+OnDark.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import UIKit

extension UIColor {
    func onDark(_ darkColor: UIColor) -> UIColor {
        return .init(dynamicProvider: { [weak self] (UITraitCollection: UITraitCollection) -> UIColor in
            if UITraitCollection.userInterfaceStyle == .dark {
                return darkColor
            } else {
                return self ?? darkColor
            }
        })
    }
}
