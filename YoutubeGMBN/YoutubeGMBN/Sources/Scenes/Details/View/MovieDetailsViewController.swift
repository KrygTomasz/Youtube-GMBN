//
//  MovieDetailsViewController.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import UIKit
import RxSwift
import RxCocoa

final class MovieDetailsViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .primary
        return view
    }()
    
    private let disposeBag: DisposeBag = DisposeBag()
    let viewModel: MovieDetailsViewModel
    let tableAdapter: MovieDetailsTableAdapter
    
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        self.tableAdapter = MovieDetailsTableAdapter()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewData()
        tableAdapter.setup(tableView: tableView, viewModel: viewModel)
        tableView.delegate = tableAdapter
        tableView.dataSource = tableAdapter
    }
    
    private func setupUI() {
        view.backgroundColor = .primary
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupViewData() {
        viewModel.output.viewData
            .drive(onNext: { [weak self] _ in
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
}
