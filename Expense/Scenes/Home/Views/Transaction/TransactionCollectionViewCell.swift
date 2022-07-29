//
//  TransactionCollectionViewCell.swift
//  Expense
//
//  Created by Егор Бадмаев on 20.07.2022.
//

import UIKit

final class TransactionCollectionViewCell: UICollectionViewCell {
    
    private let emojiBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemFill
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    private let categoryLabel = SubtitleLabel()
    private let dateLabel = SubtitleLabel()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, categoryLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelsStackView, dateLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .top
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
        emojiLabel.text = "🛍"
        categoryLabel.text = "Shopping"
        dateLabel.text = "23 July 2022"
        titleLabel.text = "-$208"
        contentView.addSubview(emojiBackgroundView)
        emojiBackgroundView.addSubview(emojiLabel)
        contentView.addSubview(mainStackView)
        contentView.backgroundColor = .secondarySystemGroupedBackground
        
        NSLayoutConstraint.activate([
            emojiBackgroundView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            emojiBackgroundView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: layoutMargins.left),
            emojiBackgroundView.heightAnchor.constraint(equalToConstant: 36),
            emojiBackgroundView.widthAnchor.constraint(equalToConstant: 36),
            
            emojiLabel.centerYAnchor.constraint(equalTo: emojiBackgroundView.centerYAnchor),
            emojiLabel.centerXAnchor.constraint(equalTo: emojiBackgroundView.centerXAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: emojiBackgroundView.trailingAnchor, constant: 12),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -layoutMargins.right),
            mainStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
