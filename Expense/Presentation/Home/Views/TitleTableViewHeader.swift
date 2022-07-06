//
//  TitleTableViewHeader.swift
//  Expense
//
//  Created by Егор Бадмаев on 03.07.2022.
//

import UIKit

final class TitleTableViewHeader: UITableViewHeaderFooterView {
    
    private let titleLabel = TitleLabel(text: "")
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with text: String) {
        titleLabel.text = text
    }
    
    private func setupView() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
        ])
    }
}
