//
//  UIButton.swift
//  Expense
//
//  Created by Егор Бадмаев on 02.07.2022.
//

import UIKit

extension UIButton {
    // Setup system button with provided parameters: title, image, background color, corner radius and shadows
    convenience init(title: String, image: UIImage, backgroundColor: UIColor, cornerStyle: UIButton.Configuration.CornerStyle, shadows: Bool) {
        var configuration = UIButton.Configuration.filled()
        configuration.title = title
        var container = AttributeContainer()
        container.font = UIFont.boldSystemFont(ofSize: 18)
        configuration.attributedTitle = AttributedString("Title", attributes: container)
        configuration.image = image
        configuration.imagePadding = 10
//        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        configuration.cornerStyle = cornerStyle
        configuration.baseBackgroundColor = backgroundColor
        configuration.baseForegroundColor = .white
        
//        self.setTitle(title, for: .normal)
//        self.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
//        self.setImage(image, for: .normal)
//        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        self.init(configuration: configuration)
//        self.tintColor = .white
//        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if shadows {
            self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 3)
            self.layer.shadowOpacity = 1.0
            self.layer.shadowRadius = 10.0
            self.layer.masksToBounds = false
        }
    }
}
