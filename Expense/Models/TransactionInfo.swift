//
//  TransactionInfo.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import Foundation

struct TransactionInfo {
    let sum: Double
    let isIncome: Bool
    
    var date: Date = Date()
    /// There is 2 ways of working with this structure: when you create new Transaction (`account = nil`) and when you update it (`account != nil`)
    var account: Account? = nil
    var notes: String? = nil
    var repeats: Period = .none
    /// Transactions take place either by category or by goal, that is why the next two properties are optionals
    var category: Category? = nil
    var goal: Goal? = nil
}
