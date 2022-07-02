//
//  UIButton.swift
//  Expense
//
//  Created by Егор Бадмаев on 02.07.2022.
//

import UIKit

extension UIButton {
    convenience init(title: String, backgroundColor: UIColor, shadows: Bool) {
        self.init(type: .system)
        self.tintColor = .white
        self.backgroundColor = UIColor(named: "AccentColor")
        self.setTitle("Add", for: .normal)
        self.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        self.setImage(Images.add, for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 0)
        self.layer.cornerRadius = 22
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if shadows {
            // TODO: Добавить тени
            
        }
    }
}
