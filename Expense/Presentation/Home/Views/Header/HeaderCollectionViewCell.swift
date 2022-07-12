//
//  HeaderCollectionViewCell.swift
//  Expense
//
//  Created by Егор Бадмаев on 12.07.2022.
//

import UIKit

final class HeaderCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel = TitleLabel()
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    private let seeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle(Texts.Home.seeAll, for: .normal)
        button.setTitleColor(UIColor.appColor, for: .normal)
//        button.addTarget(nil, action: #selector(HomeViewController.handleSeeAll), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 3
        return stackView
    }()
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelsStackView, seeAllButton])
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(title: String, subtitle: String, tag: Int) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        
        if !subtitle.isEmpty {
            seeAllButton.isHidden = false
            seeAllButton.tag = tag
        }
    }
    
    private func setupView() {
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 8),
            mainStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -8),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
        ])
    }
}
