//
//  HistoryTableViewHeader.swift
//  Expense
//
//  Created by Егор Бадмаев on 29.06.2022.
//

import UIKit

final class HistoryTableViewHeader: UITableViewHeaderFooterView {
    
    private let spacing: CGFloat = 2
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var incomeLabel = SubtitleLabel()
    private lazy var expenseLabel = SubtitleLabel()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [incomeLabel, expenseLabel])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        // TODO: ViewModel должна возвращать attributed string для чисел и рубля - они должны быть чуть жирнее, чем текст
        dateLabel.text = "6-12 июня 2022 г."
        incomeLabel.attributedText = "Доход: \(Int.random(in: 1000...10000)) ₽".toAttributedString(after: ":", ofSize: 14, with: .semibold)
        expenseLabel.attributedText = "Расход: \(Int.random(in: 1000...10000)) ₽".toAttributedString(after: ":", ofSize: 14, with: .semibold)
    }
    
    private func setupView() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(labelsStackView)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacing),

            labelsStackView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 3),
            labelsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            labelsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacing),
            labelsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -spacing * 2)
        ])
    }
}
