//
//  MovieDetailsViewController.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import UIKit

final class MovieDetailsViewController: UIViewController {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var movieDetailsView: MovieDetailsView = {
        let view = MovieDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewModel: MovieDetailsViewModel
    
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewData()
    }
    
    private func setupUI() {
        view.backgroundColor = .primary
        view.addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        containerView.addSubview(movieDetailsView)
        movieDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        movieDetailsView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        movieDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        movieDetailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setupViewData() {
        movieDetailsView.titleLabel.text = viewModel.output.viewData.title
        movieDetailsView.descriptionLabel.text = viewModel.output.viewData.description
        movieDetailsView.dateLabel.text = viewModel.output.viewData.date
        movieDetailsView.movieImageView.setImage(url: viewModel.output.viewData.imageName)
    }
}
