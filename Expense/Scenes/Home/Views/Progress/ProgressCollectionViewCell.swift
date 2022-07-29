//
//  ProgressCollectionViewCell.swift
//  Expense
//
//  Created by Егор Бадмаев on 07.07.2022.
//

import UIKit

protocol ProgressCellModelProtocol {
    var emoji: Emoji { get }
    var title: String { get }
    var firstSubtitle: String { get }
    var secondSubtitle: String { get }
    var progress: Double { get }
}

final class ProgressCollectionViewCell: UICollectionViewCell {
    
    private let progressView: CircularProgressView = {
        let progressView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 56, height: 56), lineWidth: 7)
        progressView.timeToFill = 1.3 // TODO: настроить время анимации
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, firstSubtitleLabel, secondSubtitleLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    private let firstSubtitleLabel = SubtitleLabel()
    private let secondSubtitleLabel = SubtitleLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(data: ProgressCellModelProtocol) {
        progressView.progress = data.progress
        emojiLabel.text = data.emoji.rawValue
        titleLabel.text = data.title
        firstSubtitleLabel.attributedText = data.firstSubtitle.toAttributedString(after: ":", ofSize: SubtitleLabel.fontSize, with: .semibold)
        secondSubtitleLabel.attributedText = data.secondSubtitle.toAttributedString(after: ":", ofSize: SubtitleLabel.fontSize, with: .semibold)
    }
    
    private func setupView() {
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = .secondarySystemGroupedBackground
        contentView.addSubview(progressView)
        contentView.addSubview(emojiLabel)
        contentView.addSubview(labelsStackView)
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 12),
            progressView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            emojiLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -1),
            emojiLabel.centerXAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 41),
            
            labelsStackView.leadingAnchor.constraint(equalTo: emojiLabel.trailingAnchor, constant: 32),
            labelsStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 5),
            labelsStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -7),
        ])
    }
}
