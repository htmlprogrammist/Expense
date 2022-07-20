//
//  TransactionInfo.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import Foundation

struct TransactionInfo {
//    var account: Account! // account is being provided later, in Presenter, while the instance of this structure is being created in view
    let sum: Double
    let isIncome: Bool
    
    var date: Date = Date()
    var notes: String? = nil
    var repeats: Period = .none
    /// Transactions take place either by category or by goal, that is why the next two properties are optionals
    var category: Category? = nil
    var goal: Goal? = nil
}
