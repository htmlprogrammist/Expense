//
//  UIColor.swift
//  Expense
//
//  Created by Егор Бадмаев on 06.07.2022.
//

import UIKit

extension UIColor {
    static let appColor = UIColor(named: "AccentColor") ?? .systemBlue
    static let progressColor = UIColor(named: "ProgressColor") ?? .systemGreen
//    static let cellBackground = UIColor.secondarySystemGroupedBackground // можно и другие цвета попробовать
//    static let cellBackground = UIColor.systemBackground
    static let cellBackground = UIColor(named: "HomeBackgroundColor") ?? .secondarySystemGroupedBackground
}
