//
//  UISegmentedControl.swift
//  Expense
//
//  Created by Егор Бадмаев on 14.07.2022.
//

import UIKit

extension UISegmentedControl {
    convenience init(action: Selector) {
        self.init(items: [Texts.Transactions.incomes, Texts.Transactions.expenses])
        self.selectedSegmentIndex = 1
        self.addTarget(nil, action: action, for: .valueChanged)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
