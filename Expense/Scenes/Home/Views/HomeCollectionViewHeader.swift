//
//  HomeCollectionViewHeader.swift
//  Expense
//
//  Created by Егор Бадмаев on 07.07.2022.
//

import UIKit

final class HomeCollectionViewHeader: UICollectionReusableView {
    
    private let titles = ["", Texts.Home.goals, Texts.Home.budgets, Texts.Home.more]
    private let subtitles = ["", Texts.Home.goalsDescription, Texts.Home.budgetsDescription, ""]
    
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
        button.addTarget(nil, action: #selector(HomeViewController.handleSeeAll), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    private lazy var subStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, seeAllButton])
        stackView.axis = .horizontal
        stackView.alignment = .lastBaseline
        stackView.distribution = .equalCentering
        return stackView
    }()
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [subStackView, subtitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 3
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
    
    public func configure(indexPath: IndexPath) {
        titleLabel.text = titles[indexPath.section]
        subtitleLabel.text = subtitles[indexPath.section]
        
        if !subtitles[indexPath.section].isEmpty {
            seeAllButton.isHidden = false
            seeAllButton.tag = indexPath.section
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
