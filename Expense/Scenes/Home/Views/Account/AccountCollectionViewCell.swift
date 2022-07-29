//
//  AccountCollectionViewCell.swift
//  Expense
//
//  Created by Егор Бадмаев on 12.07.2022.
//

import UIKit

final class AccountCollectionViewCell: UICollectionViewCell {
    
    private let balanceLabel = TitleLabel(ofSize: 26)
    private let emojiContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .tertiarySystemFill
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let accountNameLabel = UILabel()
    private let accountCurrencyLabel = SubtitleLabel()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [accountNameLabel, accountCurrencyLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emojiContainer, labelsStackView])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 14
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
        emojiLabel.text = "🥑"
        balanceLabel.text = "$5 981.22"
        accountNameLabel.text = "Бухгалтер"
        accountCurrencyLabel.text = "USD"
    }
    
    public func configure(account: Account) {
        emojiLabel.text = account.emoji
        balanceLabel.text = account.balance.convertToString()
        accountNameLabel.text = account.name
        accountCurrencyLabel.text = account.currency.letters
    }
    
    private func setupView() {
        contentView.backgroundColor = .secondarySystemGroupedBackground
        contentView.layer.cornerRadius = 10
        
        contentView.addSubview(mainStackView)
        emojiContainer.addSubview(emojiLabel)
        contentView.addSubview(balanceLabel)
        
        NSLayoutConstraint.activate([
            emojiContainer.widthAnchor.constraint(equalToConstant: 40),
            emojiContainer.heightAnchor.constraint(equalToConstant: 40),
            emojiLabel.centerXAnchor.constraint(equalTo: emojiContainer.centerXAnchor),
            emojiLabel.centerYAnchor.constraint(equalTo: emojiContainer.centerYAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 8),
            mainStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 6),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            balanceLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 8),
            balanceLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -4),
            balanceLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -4)
        ])
    }
}
