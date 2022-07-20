//
//  MoreCollectionViewCell.swift
//  Expense
//
//  Created by Егор Бадмаев on 06.07.2022.
//

import UIKit

final class MoreCollectionViewCell: UICollectionViewCell {
    
    private lazy var iconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 13
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let indicatorImageView: UIImageView = {
        let imageView = UIImageView(image: Images.Home.disclosureIndicator)
        imageView.tintColor = .systemGray4
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(image: UIImage?, title: String?, color: UIColor?) {
        iconImageView.image = image?.withConfiguration(UIImage.SymbolConfiguration(scale: .medium))
        iconContainer.backgroundColor = color
        textLabel.text = title
    }
    
    private func setupView() {
        contentView.addSubview(textLabel)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(indicatorImageView)
        
        iconImageView.image = Images.Home.calendar.withConfiguration(UIImage.SymbolConfiguration(scale: .medium))
        iconContainer.backgroundColor = .systemRed
        textLabel.text = Texts.Home.scheduledOperations
        
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        contentView.backgroundColor = .secondarySystemGroupedBackground
        
        NSLayoutConstraint.activate([
            iconContainer.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 6),
            iconContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconContainer.widthAnchor.constraint(equalToConstant: 27),
            iconContainer.heightAnchor.constraint(equalToConstant: 27),
            
            iconImageView.topAnchor.constraint(equalTo: iconContainer.topAnchor, constant: 3),
            iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            
            textLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            textLabel.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 12),
            textLabel.trailingAnchor.constraint(equalTo: indicatorImageView.leadingAnchor),
            
            indicatorImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            indicatorImageView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -10)
        ])
    }
}
