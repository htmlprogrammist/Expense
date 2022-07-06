//
//  HistoryTableViewHeader.swift
//  Expense
//
//  Created by Егор Бадмаев on 29.06.2022.
//

import UIKit

final class HistoryTableViewHeader: UITableViewHeaderFooterView {
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var incomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    private lazy var expenseLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
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
        incomeLabel.attributedText = getAttributedStringWithBold("Доход: \(Int.random(in: 1000...10000)) ₽", after: ":")
        expenseLabel.attributedText = getAttributedStringWithBold("Расход: \(Int.random(in: 1000...10000)) ₽", after: ":")
    }
    
    private func setupView() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(labelsStackView)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            labelsStackView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 4),
            labelsStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    private func getAttributedStringWithBold(_ text: String, after character: Character) -> NSAttributedString {
        let labelAttributedText = NSMutableAttributedString(string: text)
        let index = text.lastIndex(of: character) ?? text.startIndex
        let length = 8
        labelAttributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14, weight: .semibold), range: NSRange(location: (text.distance(from: text.startIndex, to: index)), length: length))
        return labelAttributedText
    }
}
