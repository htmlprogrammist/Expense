//
//  AccountInfo.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import Foundation

struct AccountInfo {
    let id: UUID
    let name: String
    let emoji: Emoji
    let balance: Double
    let currency: Currency
    
    var transactions: NSSet?
    var categories: NSOrderedSet?
    var goals: NSOrderedSet?
    var budgets: NSOrderedSet?
}
