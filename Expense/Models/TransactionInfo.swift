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
    let category: Category?
    let repeatEvery: Period?
    let notes: String?
}
