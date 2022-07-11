//
//  BudgetInfo.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import Foundation

struct BudgetInfo {
    let account: Account
    let sum: Int64
    let period: Period
    let category: Category
    let date: Date
}

extension Budget {
    var budgetInfo: BudgetInfo {
        BudgetInfo(account: account, sum: sum, period: period, category: category, date: date)
    }
}
