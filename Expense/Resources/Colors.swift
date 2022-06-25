//
//  Colors.swift
//  Expense
//
//  Created by Егор Бадмаев on 23.06.2022.
//

import UIKit

enum Colors {
    static var backgroundColor: UIColor {
        if #available(iOS 13.0, *) {
            return .systemBackground
        } else {
            return .white
        }
    }
    static var placeholderColor: UIColor {
        if #available(iOS 13.0, *) {
            return .placeholderText
        } else {
            return UIColor(red: 196/255, green: 196/255, blue: 198/255, alpha: 1)
        }
    }
    static var secondaryLabelColor: UIColor {
        if #available(iOS 13.0, *) {
            return .secondaryLabel
        } else {
            return UIColor(red: 141/255, green: 141/255, blue: 147/255, alpha: 1)
        }
    }
}
