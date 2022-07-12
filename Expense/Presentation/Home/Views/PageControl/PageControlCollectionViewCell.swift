//
//  PageControlCollectionViewCell.swift
//  Expense
//
//  Created by Егор Бадмаев on 12.07.2022.
//

import UIKit

final class PageControlCollectionViewCell: UICollectionViewCell {
    
    let pageControl = UIPageControl()
    
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
        contentView.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
//            pageControl.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
//            pageControl.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
        ])
    }
}
