//
//  TitleLabel.swift
//  Expense
//
//  Created by Егор Бадмаев on 03.07.2022.
//

import UIKit

final class TitleLabel: UILabel {
    
    init(text: String = "", ofSize: CGFloat = 22) {
        super.init(frame: .zero)
        self.text = text
        font = UIFont.systemFont(ofSize: ofSize, weight: .bold)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
