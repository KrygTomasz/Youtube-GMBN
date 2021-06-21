//
//  MoviesListTableAdapter.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import UIKit
import RxSwift

final class MoviesListTableAdapter {
    enum Cell: TableCellProvider, CaseIterable {
        case movie
        
        var cellType: UITableViewCell.Type {
            switch self {
            case .movie:
                return MovieTableViewCell.self
            }
        }
    }
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    func setup(tableView: UITableView, viewModel: MoviesListViewModel) {
        tableView.register(cells: Cell.self)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .primary
        viewModel.output.viewData
            .drive(tableView.rx.items) { [weak self] (tableView, row, item) in
                guard let self = self else { return UITableViewCell() }
                return self.getCell(for: item, at: IndexPath(row: row, section: 0), in: tableView)
            }.disposed(by: disposeBag)
    }
    
    private func getCell(for viewData: MovieViewData, at indexPath: IndexPath, in tableView: UITableView) -> MovieTableViewCell {
        let cell = tableView.dequeueReusableCell(cell: Cell.movie, for: indexPath) as! MovieTableViewCell
        cell.set(viewData: viewData)
        return cell
    }
}
