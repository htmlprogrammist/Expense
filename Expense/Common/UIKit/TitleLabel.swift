//
//  TitleLabel.swift
//  Expense
//
//  Created by Егор Бадмаев on 03.07.2022.
//

import UIKit

final class TitleLabel: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        font = UIFont.systemFont(ofSize: 24, weight: .bold)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
