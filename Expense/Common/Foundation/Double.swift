//
//  Double.swift
//  Expense
//
//  Created by Егор Бадмаев on 18.07.2022.
//

extension Double {
    func convertToString() -> String {
        (Settings.shared.roundingNumbers ?? false) ? "\(Int(self.rounded()))" : "\(self)"
    }
}
