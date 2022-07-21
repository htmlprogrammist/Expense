//
//  MainCollectionViewCell.swift
//  Expense
//
//  Created by Егор Бадмаев on 06.07.2022.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    
    private let progressView: CircularProgressView = {
        let progressView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 18, height: 18), lineWidth: nil, rounded: false)
//        progressView.trackColor = .tertiarySystemFill
        progressView.trackColor = .clear
        progressView.progressColor = .progressColor
        progressView.timeToFill = 1.3 // TODO: настроить время анимации
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    private let subtitleLabel = SubtitleLabel()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
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
        emojiLabel.text = "💻"
        progressView.progress = Double.random(in: 0...1)
        titleLabel.text = "MacBook Pro 14' M1 Max"
        subtitleLabel.text = "\(102500) ₽ → \(250000) ₽"
        contentView.backgroundColor = .mainBackgroundColor
        contentView.addSubview(progressView)
        contentView.addSubview(emojiLabel)
        contentView.addSubview(labelsStackView)
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: layoutMargins.left + 9),
            progressView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 14),
            
            emojiLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: layoutMargins.left + 6),
            emojiLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            labelsStackView.leadingAnchor.constraint(equalTo: emojiLabel.trailingAnchor, constant: 16),
            labelsStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
