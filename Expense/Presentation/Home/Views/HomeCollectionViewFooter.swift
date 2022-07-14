//
//  HomeCollectionViewFooter.swift
//  Expense
//
//  Created by Егор Бадмаев on 13.07.2022.
//

import UIKit

final class HomeCollectionViewFooter: UICollectionReusableView {
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .appColor
        pageControl.pageIndicatorTintColor = .systemGray4
        pageControl.isEnabled = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(numberOfPages: Int) {
        pageControl.numberOfPages = numberOfPages
    }
    
    private func setupView() {
        addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
