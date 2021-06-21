//
//  UITableView+Register.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import UIKit

extension UITableView {
    public func register<Cells: CaseIterable & TableCellProvider>(cells: Cells.Type) {
        Cells.allCases.forEach { (cell) in
            register(cell.cellType, forCellReuseIdentifier: cell.cellType.description())
        }
    }
    
    public func dequeueReusableCell<Cell: TableCellProvider>(cell: Cell, for indexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: cell.cellType.description(), for: indexPath)
    }
}
