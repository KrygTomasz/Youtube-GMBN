//
//  MoviesListViewController.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import UIKit
import RxSwift

final class MoviesListViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let view = UIRefreshControl()
        return view
    }()
    
    let viewModel: MoviesListViewModel
    let tableAdapter: MoviesListTableAdapter
    let disposeBag: DisposeBag = DisposeBag()
    
    init(viewModel: MoviesListViewModel) {
        self.viewModel = viewModel
        self.tableAdapter = MoviesListTableAdapter()
        super.init(nibName: nil, bundle: nil)
        tableView.refreshControl = refreshControl
        tableAdapter.setup(tableView: tableView, viewModel: viewModel)
        
        viewModel.output.selectedMovie
            .subscribe(onNext: { [weak self] movie in
                self?.goToDetails(movie: movie)
            })
            .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.refresh()
        title = "movies_list_title".localized
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func goToDetails(movie: Movie) {
        let viewController = MovieDetailsViewControllerFactory.create(movie: movie)
        present(viewController, animated: true)
    }
}
