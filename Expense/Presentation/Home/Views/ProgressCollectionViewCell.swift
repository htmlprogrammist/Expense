//
//  ProgressCollectionViewCell.swift
//  Expense
//
//  Created by Егор Бадмаев on 07.07.2022.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    
    private let progressView: CircularProgressView = {
        let progressView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), lineWidth: 15, rounded: false)
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
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(progressView)
        
        NSLayoutConstraint.activate([
            
        ])
    }
}
