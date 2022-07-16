//
//  HistoryTableViewHeader.swift
//  Expense
//
//  Created by Егор Бадмаев on 29.06.2022.
//

import UIKit

enum DateTag {}
typealias StringDate = Tagged<DateTag, String>

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
    
    public func configure(date: StringDate, income: NSAttributedString, expense: NSAttributedString) {
        dateLabel.text = date.rawValue
        incomeLabel.attributedText = income
        expenseLabel.attributedText = expense
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
