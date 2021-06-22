//
//  ImageTableViewCell.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    private enum Constants {
        static let imageSize: CGFloat = 200.0
    }
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = .mediumMargin
        return view
    }()
    
    lazy var imageContainer: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        selectionStyle = .none
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.addSubview(imageContainer)
    }
    
    private func setupConstraints() {
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .hugeMargin).isActive = true
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .smallMargin).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.hugeMargin).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.smallMargin).isActive = true
        imageContainer.heightAnchor.constraint(equalToConstant: Constants.imageSize).isActive = true
        
        imageContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        imageContainer.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        imageContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        imageContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true

    }
}
