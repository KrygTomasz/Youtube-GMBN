//
//  MovieDetailsTableAdapter.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import UIKit

class MovieDetailsTableAdapter: NSObject {
    private enum Constants {
        static let bigFontSize: CGFloat = 30.0
        static let mediumFontSize: CGFloat = 18.0
        static let smallFontSize: CGFloat = 12.0
    }
    
    enum Cell: Int, TableCellProvider, CaseIterable {
        case date
        case image
        case duration
        case title
        case description
        
        var cellType: UITableViewCell.Type {
            switch self {
            case .image:
                return ImageTableViewCell.self
            case .title:
                return LabelTableViewCell.self
            case .description:
                return LabelTableViewCell.self
            case .date:
                return LabelTableViewCell.self
            case .duration:
                return LabelTableViewCell.self
            }
        }
    }
    
    private weak var viewModel: MovieDetailsViewModel?
    
    func setup(tableView: UITableView, viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        tableView.register(cells: Cell.self)
        tableView.separatorStyle = .none
        tableView.contentInset = .init(top: .mediumMargin, left: .zero, bottom: .zero, right: .zero)
    }
}

extension MovieDetailsTableAdapter: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Cell.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Cell(rawValue: indexPath.section) else { return UITableViewCell() }
        switch section {
        case .image:
            let cell = tableView.dequeueReusableCell(cell: Cell.image, for: indexPath) as! ImageTableViewCell
            cell.imageContainer.setImage(url: viewModel?.output.currentViewData?.imageName ?? "")
            return cell
        case .date:
            let cell = tableView.dequeueReusableCell(cell: Cell.date, for: indexPath) as! LabelTableViewCell
            cell.titleLabel.text = viewModel?.output.currentViewData?.date
            cell.set(font: .boldSystemFont(ofSize: Constants.smallFontSize), alignment: .right)
            return cell
        case .title:
            let cell = tableView.dequeueReusableCell(cell: Cell.title, for: indexPath) as! LabelTableViewCell
            cell.titleLabel.text = viewModel?.output.currentViewData?.title
            cell.set(font: .boldSystemFont(ofSize: Constants.bigFontSize), alignment: .left)
            return cell
        case .description:
            let cell = tableView.dequeueReusableCell(cell: Cell.description, for: indexPath) as! LabelTableViewCell
            cell.titleLabel.text = viewModel?.output.currentViewData?.description
            cell.set(font: .italicSystemFont(ofSize: Constants.mediumFontSize), alignment: .left)
            return cell
        case .duration:
            let cell = tableView.dequeueReusableCell(cell: Cell.duration, for: indexPath) as! LabelTableViewCell
            cell.titleLabel.text = viewModel?.output.currentViewData?.duration
            cell.set(font: .boldSystemFont(ofSize: Constants.smallFontSize), alignment: .right)
            return cell
        }
    }
}
