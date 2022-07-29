//
//  HomeCollectionViewHeader.swift
//  Expense
//
//  Created by Егор Бадмаев on 07.07.2022.
//

import UIKit

final class HomeCollectionViewHeader: UICollectionReusableView {
    
    private var titles = ["", Texts.Home.more]
    private var subtitles = ["", ""]
    
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
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureTitles()
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
    
    private func configureTitles() {
        if (Settings.shared.showBudgets ?? true) {
            titles.insert(Texts.Home.budgets, at: 1)
            subtitles.insert(Texts.Home.budgetsDescription, at: 1)
        }
        if (Settings.shared.showGoals ?? true) {
            titles.insert(Texts.Home.goals, at: 1)
            subtitles.insert(Texts.Home.goalsDescription, at: 1)
        }
    }
    
    private func setupView() {
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: layoutMargins.left),
            mainStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -layoutMargins.right),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -layoutMargins.bottom),
        ])
    }
}
