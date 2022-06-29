//
//  TransactionInfo.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import Foundation

struct TransactionInfo {
    let wallet: Wallet
    let sum: Int
    let isExpense: Bool
    /// Transactions take place either by category or by goal, that is why the next two properties are optionals
    let category: Category?
    let goal: Goal?
    
    let notes: String?
    var repeatEvery: Period = .none
}

extension Transaction {
    var transactionInfo: TransactionInfo {
        TransactionInfo(wallet: wallet, sum: Int(sum), isExpense: isExpense, category: category, goal: goal, notes: notes, repeatEvery: repeatEvery)
    }
}
