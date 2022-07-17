//
//  UIAlertController.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//

import UIKit

/// this code is needed so that the console no longer displays an error about the allegedly negative width on iOS 13
extension UIAlertController {
    func negativeWidthConstraint() {
        for subView in self.view.subviews {
            for constraints in subView.constraints where constraints.debugDescription.contains("width == - 16") {
                subView.removeConstraint(constraints)
            }
        }
    }
}
