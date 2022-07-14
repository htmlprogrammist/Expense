//
//  SubtitleLabel.swift
//  Expense
//
//  Created by Егор Бадмаев on 12.07.2022.
//

import UIKit

final class SubtitleLabel: UILabel {
    
    init(text: String = "") {
        super.init(frame: .zero)
        self.text = text
        textColor = .secondaryLabel
        font = UIFont.systemFont(ofSize: 14)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
