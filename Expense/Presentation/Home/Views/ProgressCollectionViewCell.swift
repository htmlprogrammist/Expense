//
//  ProgressCollectionViewCell.swift
//  Expense
//
//  Created by Егор Бадмаев on 07.07.2022.
//

import UIKit

final class ProgressCollectionViewCell: UICollectionViewCell {
    
    private let progressView: CircularProgressView = {
        let progressView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 60, height: 60), lineWidth: 12, rounded: false)
        progressView.timeToFill = 1.3
        progressView.progressColor = .appColor
        progressView.trackColor = .systemGroupedBackground
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
//        progressView.progress = 
    }
    
    private func setupView() {
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(progressView)
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            progressView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
