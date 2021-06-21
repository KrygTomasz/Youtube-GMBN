//
//  MovieTableViewCell.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import UIKit
import RxSwift

final class MovieTableViewCell: UITableViewCell {
    private enum Constants {
        static let cellHeight: CGFloat = 100.0
        static let imageSize: CGFloat = 80.0
        static let cornerRadius: CGFloat = 10.0
        static let shadowRadius: CGFloat = 6.0
        static let shadowOpacity: Float = 0.3
        static let shadowOffset: CGSize = CGSize(width: 0, height: 2)
    }
    
    var disposeBag: DisposeBag = DisposeBag()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = Constants.cornerRadius
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .center
        view.spacing = .smallMargin
        return view
    }()
    
    private lazy var movieImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.heightAnchor.constraint(equalToConstant: Constants.imageSize).isActive = true
        view.widthAnchor.constraint(equalToConstant: Constants.imageSize).isActive = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
        setupShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        selectionStyle = .none
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(movieImageView)
        stackView.addArrangedSubview(titleLabel)
    }
    
    private func setupConstraints() {
        containerView.heightAnchor.constraint(equalToConstant: Constants.cellHeight).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .smallMargin).isActive = true
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .smallMargin).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.smallMargin).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.smallMargin).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
    private func setupShadow() {
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowRadius = Constants.shadowRadius
        containerView.layer.shadowOpacity = Constants.shadowOpacity
        containerView.layer.shadowOffset = Constants.shadowOffset
    }
    
    public func set(viewData: MovieViewData) {
        movieImageView.isHidden = viewData.image == nil
        movieImageView.image = viewData.image
        titleLabel.text = viewData.title
    }
}
