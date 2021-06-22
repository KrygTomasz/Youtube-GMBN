//
//  LabelTableViewCell.swift
//  YoutubeGMBN
//
//  Created by Tomasz Kryg on 21/06/2021.
//

import UIKit

class LabelTableViewCell: UITableViewCell {
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.cornerRadius = .mediumMargin
        return view
    }()
    
    lazy var labelStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillProportionally
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        selectionStyle = .none
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        contentView.addSubview(containerView)

        containerView.addSubview(labelStackView)
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(descriptionLabel)

        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .hugeMargin).isActive = true
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .smallMargin).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.hugeMargin).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.smallMargin).isActive = true
        
        labelStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .smallMargin).isActive = true
        labelStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: .smallMargin).isActive = true
        labelStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -.smallMargin).isActive = true
        labelStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -.smallMargin).isActive = true
    }
    
    func setTitle(font: UIFont, alignment: NSTextAlignment, color: UIColor) {
        titleLabel.font = font
        titleLabel.textAlignment = alignment
        titleLabel.textColor = color
    }
    
    func setDescription(font: UIFont, alignment: NSTextAlignment, color: UIColor) {
        descriptionLabel.font = font
        descriptionLabel.textAlignment = alignment
        descriptionLabel.textColor = color
    }
    
    func set(title: String?, description: String? = nil) {
        titleLabel.text = title
        descriptionLabel.text = description
        descriptionLabel.isHidden = description == nil
    }
}
