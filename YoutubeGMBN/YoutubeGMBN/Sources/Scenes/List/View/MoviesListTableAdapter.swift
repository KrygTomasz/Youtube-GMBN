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
        setupBinding(tableView: tableView, viewModel: viewModel)
    }
    
    private func setupBinding(tableView: UITableView, viewModel: MoviesListViewModel) {
        viewModel.output.viewData
            .drive(tableView.rx.items) { [weak self] (tableView, row, item) in
                guard let self = self else { return UITableViewCell() }
                return self.getCell(for: item, at: IndexPath(row: row, section: 0), in: tableView)
            }.disposed(by: disposeBag)
        
        viewModel.events
            .drive(onNext: { event in
                switch event {
                case .showLoading:
                    tableView.refreshControl?.beginRefreshing()
                case .hideLoading:
                    tableView.refreshControl?.endRefreshing()
                }
            })
            .disposed(by: disposeBag)
        
        tableView.refreshControl?.rx.controlEvent(.valueChanged)
            .subscribe(onNext: { _ in
                let isRefreshing = tableView.refreshControl?.isRefreshing ?? false
                if isRefreshing { viewModel.refresh() }
            })
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .asDriver()
            .drive(onNext: { indexPath in
                viewModel.input.selectMovie.accept(indexPath)
            })
            .disposed(by: disposeBag)
    }
    
    private func getCell(for viewData: MovieViewData, at indexPath: IndexPath, in tableView: UITableView) -> MovieTableViewCell {
        let cell = tableView.dequeueReusableCell(cell: Cell.movie, for: indexPath) as! MovieTableViewCell
        cell.set(viewData: viewData)
        return cell
    }
}
