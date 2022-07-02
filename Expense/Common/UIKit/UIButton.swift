//
//  UIButton.swift
//  Expense
//
//  Created by Егор Бадмаев on 02.07.2022.
//

import UIKit

extension UIButton {
    // Setup button with rounded borders
    convenience init(title: String, image: UIImage, backgroundColor: UIColor, cornerRadius: CGFloat, shadows: Bool) {
        self.init(type: .system)
        self.tintColor = .white
        self.backgroundColor = UIColor(named: "AccentColor")
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        self.setImage(image, for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 0)
        self.layer.cornerRadius = cornerRadius
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if shadows {
            self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 3)
            self.layer.shadowOpacity = 1.0
            self.layer.shadowRadius = 10.0
            self.layer.masksToBounds = false
        }
    }
}
