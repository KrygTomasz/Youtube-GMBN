//
//  TableCellProvider.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import UIKit

public protocol TableCellProvider: CaseIterable {
    var cellType: UITableViewCell.Type { get }
}
