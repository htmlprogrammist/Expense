//
//  String.swift
//  Expense
//
//  Created by Егор Бадмаев on 23.06.2022.
//

import Foundation

extension String {
    /// For simplify localizing texts in the whole application
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
