//
//  InfoCollectionViewCell.swift
//  Expense
//
//  Created by Егор Бадмаев on 20.07.2022.
//

import UIKit

final class InfoCollectionViewCell: UICollectionViewCell {
    
    // horizontal stack view with two centered labels with incomes and expenses by current month
    private let incomeTitle = TitleLabel(ofSize: 22)
    private let incomeSubtitle = SubtitleLabel(text: Texts.Home.monthlyIncome)
    private lazy var incomeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [incomeBullet, incomeTitle])
        stackView.spacing = 7
        stackView.alignment = .center
        stackView.axis = .horizontal
        return stackView
    }()
    private let incomeBullet = BulletView(size: 6, backgroundColor: .systemGreen)
    private lazy var income: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [incomeStackView, incomeSubtitle])
        stackView.spacing = 1
        stackView.axis = .vertical
        return stackView
    }()
    
    private let expenseTitle = TitleLabel(ofSize: 22)
    private let expenseSubtitle = SubtitleLabel(text: Texts.Home.monthlyExpense)
    private lazy var expenseStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [expenseBullet, expenseTitle])
        stackView.spacing = 7
        stackView.alignment = .center
        stackView.axis = .horizontal
        return stackView
    }()
    private let expenseBullet = BulletView(size: 6, backgroundColor: .systemGray2)
    private lazy var expense: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [expenseStackView, expenseSubtitle])
        stackView.spacing = 1
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
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
    
    public func configure() {
        
    }
    
    private func setupView() {
        incomeTitle.text = "$105600"
        expenseTitle.text = "$40512"
        contentView.backgroundColor = .mainBackgroundColor
        
        mainStackView.addArrangedSubview(income)
        mainStackView.addArrangedSubview(expense)
        contentView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: layoutMargins.left),
            mainStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -layoutMargins.right),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
