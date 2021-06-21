//
//  MovieDetailsView.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import UIKit

public class MovieDetailsView: UIView {
    private enum Constants {
        static let titleFontSize: CGFloat = 30.0
        static let dateFontSize: CGFloat = 12.0
        static let imageSize: CGFloat = 300.0
    }
    
    lazy var movieImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .tertiary
        label.font = .boldSystemFont(ofSize: Constants.titleFontSize)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .tertiary
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .tertiary
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "duration"
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .tertiary
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: Constants.dateFontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(movieImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(durationLabel)
        addSubview(dateLabel)
    }
    
    private func setupConstraints() {
        movieImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        movieImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .hugeMargin).isActive = true
        movieImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.hugeMargin).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize).isActive = true
        
        durationLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: .smallMargin).isActive = true
        durationLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor).isActive = true
        durationLabel.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor).isActive = true
//        durationLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
//        durationLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)

        dateLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor).isActive = true
//        dateLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: .hugeMargin).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .hugeMargin).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -.hugeMargin).isActive = true
        descriptionLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
