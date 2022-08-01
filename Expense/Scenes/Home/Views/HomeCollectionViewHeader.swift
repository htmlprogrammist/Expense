//
//  HomeCollectionViewHeader.swift
//  Expense
//
//  Created by Егор Бадмаев on 07.07.2022.
//

import UIKit

final class HomeCollectionViewHeader: UICollectionReusableView {
    
    private var titles = ["", "", Texts.Home.goals, Texts.Home.budgets, Texts.Home.planned]
    
    private let titleLabel = TitleLabel()
    private let seeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle(Texts.Home.seeAll, for: .normal)
        button.setTitleColor(UIColor.appColor, for: .normal)
        button.addTarget(nil, action: #selector(HomeViewController.handleSeeAll), for: .touchUpInside)
        return button
    }()
    private let addSomethingButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(nil, action: #selector(HomeViewController.handleAdding), for: .touchUpInside)
        button.setImage(Images.Home.add.withConfiguration(UIImage.SymbolConfiguration(weight: UIImage.SymbolWeight.regular)), for: .normal)
        return button
    }()
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
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
    
    public func configure(indexPath: IndexPath) {
        titleLabel.text = titles[indexPath.section]
        seeAllButton.tag = indexPath.section
        addSomethingButton.tag = indexPath.section
    }
    
    public func setupButton(sectionHasCell: Bool) {
        if sectionHasCell {
            mainStackView.addArrangedSubview(seeAllButton)
        } else {
            mainStackView.addArrangedSubview(addSomethingButton)
        }
    }
    
    private func setupView() {
        backgroundColor = .mainBackgroundColor
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: layoutMargins.left),
            mainStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -layoutMargins.right),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
