//
//  ProgressCollectionViewCell.swift
//  Expense
//
//  Created by Егор Бадмаев on 07.07.2022.
//

import UIKit

/*
 Вот на данном этапе я не знаю, что сделать:
 1. Либо extension моделей GoalInfo и BudgetInfo
 2. Либо в UseCases прописать получение и расчёт всех данных
 
 На данный момент, я предпочитаю последний вариант, поскольку мне нужно получить Core Data entity (либо Goal, либо Budget) и уже из них сварганить что-то такое
 
 Или нет... так будет проще... намного проще... но тогда статус Entity потеряется, это уже будет Model. Но мне нужно передать во ViewController со списком целей или бюджетов кордатовские модели, иначе никак, ведь на удаление или изменнеие придётся использовать именно их
 */
protocol ProgressCellModelProtocol {
    var emoji: Emoji { get }
    var title: String { get }
    var firstSubtitle: String { get }
    var secondSubtitle: String { get }
    var progress: Double { get }
}

final class ProgressCollectionViewCell: UICollectionViewCell {
    
    private let progressView: CircularProgressView = {
        let progressView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 56, height: 56), lineWidth: 8)
        progressView.timeToFill = 1.3 // TODO: настроить время анимации
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, firstSubtitleLabel, secondSubtitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    private let firstSubtitleLabel: UILabel = {
        let label = UILabel()
//        label.attributedText = "Бюджет: \(Int.random(in: 1000...10000)) ₽".getAttributedString(after: ":", ofSize: 15, with: .semibold)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    private let secondSubtitleLabel: UILabel = {
        let label = UILabel()
//        label.attributedText = "Потрачено: \(Int.random(in: 1000...10000)) ₽".getAttributedString(after: ":", ofSize: 15, with: .semibold)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
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
        firstSubtitleLabel.text = data.firstSubtitle
        secondSubtitleLabel.text = data.secondSubtitle
    }
    
    private func setupView() {
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = .cellBackground
        contentView.addSubview(progressView)
        contentView.addSubview(emojiLabel)
        contentView.addSubview(labelsStackView)
        
        struct ProgressCellModel: ProgressCellModelProtocol {
            let emoji: Emoji
            let title: String
            let firstSubtitle: String
            let secondSubtitle: String
            let progress: Double
        }
        let data = ProgressCellModel(emoji: Tagged("🎡"), title: "Развлечения", firstSubtitle: "Бюджет: \(Int.random(in: 1000...10000)) ₽", secondSubtitle: "Потрачено: \(Int.random(in: 1000...10000)) ₽", progress: Double.random(in: 0...1))
        progressView.progress = data.progress
        emojiLabel.text = data.emoji.rawValue
        titleLabel.text = data.title
        firstSubtitleLabel.text = data.firstSubtitle
        secondSubtitleLabel.text = data.secondSubtitle
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 6),
            progressView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            emojiLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            emojiLabel.centerXAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 35),
            
            labelsStackView.leadingAnchor.constraint(equalTo: emojiLabel.trailingAnchor, constant: 32),
            labelsStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -4),
        ])
    }
}
