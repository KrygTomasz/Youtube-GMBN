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
        case comments
        
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
            case .comments:
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

// MARK: – UITableView delegates

extension MovieDetailsTableAdapter: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Cell.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Cell(rawValue: section) else { return 0 }
        switch section {
        case .comments:
            return viewModel?.output.currentCommentViewData.count ?? 0
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Cell(rawValue: indexPath.section) else { return UITableViewCell() }
        switch section {
        case .image:
            let cell = tableView.dequeueReusableCell(cell: Cell.image, for: indexPath) as! ImageTableViewCell
            cell.imageContainer.setImage(url: viewModel?.output.currentViewData?.imageName ?? "")
            return cell
        case .date:
            return getDateCell(at: indexPath, tableView: tableView)
        case .title:
            return getTitleCell(at: indexPath, tableView: tableView)
        case .description:
            return getDescriptionCell(at: indexPath, tableView: tableView)
        case .duration:
            return getDurationCell(at: indexPath, tableView: tableView)
        case .comments:
            return getCommentCell(at: indexPath, tableView: tableView)
        }
    }
    
    // MARK: – Cells configuration
    
    private func getDateCell(at indexPath: IndexPath, tableView: UITableView) -> LabelTableViewCell {
        let cell = tableView.dequeueReusableCell(cell: Cell.date, for: indexPath) as! LabelTableViewCell
        cell.set(title: viewModel?.output.currentViewData?.date)
        cell.setTitle(font: .boldSystemFont(ofSize: Constants.smallFontSize), alignment: .right, color: .tertiary)
        cell.containerView.backgroundColor = .clear
        return cell
    }
    
    private func getTitleCell(at indexPath: IndexPath, tableView: UITableView) -> LabelTableViewCell {
        let cell = tableView.dequeueReusableCell(cell: Cell.title, for: indexPath) as! LabelTableViewCell
        cell.set(title: viewModel?.output.currentViewData?.title)
        cell.setTitle(font: .boldSystemFont(ofSize: Constants.bigFontSize), alignment: .left, color: .tertiary)
        cell.containerView.backgroundColor = .clear
        return cell
    }
    
    private func getDescriptionCell(at indexPath: IndexPath, tableView: UITableView) -> LabelTableViewCell {
        let cell = tableView.dequeueReusableCell(cell: Cell.description, for: indexPath) as! LabelTableViewCell
        cell.set(title: viewModel?.output.currentViewData?.description)
        cell.setTitle(font: .italicSystemFont(ofSize: Constants.mediumFontSize), alignment: .left, color: .tertiary)
        cell.containerView.backgroundColor = .clear
        return cell
    }
    
    private func getDurationCell(at indexPath: IndexPath, tableView: UITableView) -> LabelTableViewCell {
        let cell = tableView.dequeueReusableCell(cell: Cell.duration, for: indexPath) as! LabelTableViewCell
        cell.set(title: viewModel?.output.currentViewData?.duration)
        cell.setTitle(font: .boldSystemFont(ofSize: Constants.smallFontSize), alignment: .right, color: .tertiary)
        cell.containerView.backgroundColor = .clear
        return cell
    }
    
    private func getCommentCell(at indexPath: IndexPath, tableView: UITableView) -> LabelTableViewCell {
        let cell = tableView.dequeueReusableCell(cell: Cell.duration, for: indexPath) as! LabelTableViewCell
        let viewData = viewModel?.output.getCommentViewData(at: indexPath)
        cell.set(title: viewData?.text, description: viewData?.author)
        cell.setTitle(font: .systemFont(ofSize: Constants.smallFontSize), alignment: .left, color: .secondary)
        cell.setDescription(font: .italicSystemFont(ofSize: Constants.smallFontSize), alignment: .right, color: .secondary)
        cell.containerView.backgroundColor = .tertiary
        return cell
    }
}
