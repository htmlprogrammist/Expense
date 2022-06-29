//
//  WalletInfo.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import Foundation

struct WalletInfo {
    let name: String
    let emoji: String
    
    var transactions: NSSet?
    var categories: NSSet?
    var goals: NSSet?
    var budgets: NSSet?
}

extension Wallet {
    var walletInfo: WalletInfo {
        WalletInfo(name: name, emoji: emoji, transactions: transactions, categories: categories, goals: goals, budgets: budgets)
    }
}
