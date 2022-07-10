//
//  AccountInfo.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import Foundation

struct AccountInfo {
    let name: String
    let emoji: String
    let balance: Int64
    
    var transactions: NSSet?
    var categories: NSSet?
    var goals: NSSet?
    var budgets: NSSet?
}

extension Account {
    var walletInfo: AccountInfo {
        AccountInfo(name: name, emoji: emoji, balance: balance, transactions: transactions, categories: categories, goals: goals, budgets: budgets)
    }
}
