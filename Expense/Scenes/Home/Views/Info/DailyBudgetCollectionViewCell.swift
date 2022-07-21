//
//  DailyBudgetCollectionViewCell.swift
//  Expense
//
//  Created by Егор Бадмаев on 20.07.2022.
//

import UIKit

final class DailyBudgetCollectionViewCell: UICollectionViewCell {
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 7
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let iconImageView: UIImageView = {
        let imageView = UIImageView(image: Images.Home.dailyBudget)
        imageView.tintColor = .systemGreen
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let dailyBudgetLabel = TitleLabel(ofSize: 18)
    private let dailyBudgetDescriptionLabel = SubtitleLabel(text: Texts.Home.dailyBudget)
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dailyBudgetLabel, dailyBudgetDescriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let indicatorImageView: UIImageView = {
        let imageView = UIImageView(image: Images.Home.disclosureIndicator)
        imageView.tintColor = .systemGray4
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(dailyBudget: Double) {
        dailyBudgetLabel.text = "$" + dailyBudget.convertToString()
    }
    
    private func setupView() {
        contentView.backgroundColor = .cellBackground
        contentView.addSubview(iconImageView)
        contentView.addSubview(labelsStackView)
        contentView.addSubview(indicatorImageView)
        contentView.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: layoutMargins.left),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            labelsStackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12),
            labelsStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            indicatorImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            indicatorImageView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -layoutMargins.right),
            
            separatorView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: layoutMargins.left),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
