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
    
    private let disposeBag: DisposeBag = DisposeBag()
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
        viewModel.output.viewData
            .drive(onNext: { [weak self] viewData in
                self?.movieDetailsView.titleLabel.text = viewData?.title
                self?.movieDetailsView.descriptionLabel.text = viewData?.description
                self?.movieDetailsView.dateLabel.text = viewData?.date
                self?.movieDetailsView.durationLabel.text = viewData?.duration
                self?.movieDetailsView.movieImageView.setImage(url: viewData?.imageName ?? "")
            })
            .disposed(by: disposeBag)
    }
}
