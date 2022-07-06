//
//  EmojiCollectionViewCell.swift
//  EmojiPicker
//
//  Created by Иван Изюмкин on 01.06.2022.
//

import UIKit

final class EmojiCollectionViewCell: UICollectionViewCell {
    
    public var emoji: String? {
        didSet {
            emojiLabel.text = emoji
        }
    }
    
    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelectedBackgroundView()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(emojiLabel)
        
        NSLayoutConstraint.activate([
            emojiLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            emojiLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            emojiLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            emojiLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupSelectedBackgroundView() {
        let selectedView = UIView()
        selectedView.backgroundColor = .opaqueSeparator
        selectedView.clipsToBounds = true
        selectedView.layer.cornerRadius = 8
        selectedView.layer.cornerCurve = .continuous
        selectedBackgroundView = selectedView
    }
}
