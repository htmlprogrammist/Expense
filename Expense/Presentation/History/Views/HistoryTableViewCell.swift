//
//  HistoryTableViewCell.swift
//  Expense
//
//  Created by Егор Бадмаев on 29.06.2022.
//

import UIKit

final class HistoryTableViewCell: UITableViewCell {
    
    private lazy var emoji: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelsStackView, timeLabel])
        stackView.axis = .horizontal
        stackView.spacing = 14
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: UIFont.systemFontSize) // 14
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sumLabel, categoryLabel, notesLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        return stackView
    }()
    private lazy var sumLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: UIFont.systemFontSize) // 14
        return label
    }()
    private lazy var notesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: UIFont.systemFontSize - 1) // 13
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(isDay: Bool) {
        emoji.text = "🍕" // transaction.category.emoji
        categoryLabel.text = "Кафе" // transaction.category.name
        sumLabel.text = "-540 ₽" // "-\(transaction.sum) ₽"
        timeLabel.text = "19:30" // "\(transaction.date.formatTo(...))"
        notesLabel.text = "Тусил с друзьями на горе многострочный текст" // transaction.notes
        
        // TODO: Если segmentedIndex (или как там) == 0, то 1. стрелка не появляется и 2. пишется время (чч:мм)
        // пока что получилось не очень, но, я думаю, эта проблема исчезнет, когда будет полноценная загрузка данных
        if !isDay {
            accessoryType = .disclosureIndicator
            timeLabel.isHidden = true
            notesLabel.isHidden = true
        }
    }
    
    private func commonInit() {
        contentView.addSubview(emoji)
        contentView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            emoji.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 4),
            emoji.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: emoji.trailingAnchor, constant: 16),
            mainStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 4),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -4),
        ])
    }
}
