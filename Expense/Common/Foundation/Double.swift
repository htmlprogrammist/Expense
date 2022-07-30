//
//  Double.swift
//  Expense
//
//  Created by Егор Бадмаев on 18.07.2022.
//

import Foundation

extension Double {
    /**
     Rounds `Double` to `Int` or by two fraction digits. This function is being used for displaying numbers in labels
     
     - Returns: from `12.345` - `12` or `12.35`
     */
    func convertToString() -> String {
        (UserDefaults.roundingNumbers) ? "\(Int(self.rounded()))" : "\((self * 100).rounded() / 100.0)"
    }
}
