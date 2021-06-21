//
//  UIImageView+SetImage.swift
//  GMBNNetworking
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import Kingfisher
import UIKit

public extension UIImageView {
    func setImage(url urlPath: String) {
        let url = URL(string: urlPath)
        self.kf.setImage(with: url)
    }
}
