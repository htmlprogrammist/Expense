//
//  GoalInfo.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import Foundation

struct GoalInfo {
    let wallet: Account
    let name: String
    let emoji: String
    let aim: Int64
    let dateCreated: Date
    let dateDeadline: Date?
    var current: Int64 = 0
}

extension Goal {
    var goalInfo: GoalInfo {
        GoalInfo(wallet: wallet, name: name, emoji: emoji, aim: aim, dateCreated: dateCreated, dateDeadline: dateDeadline, current: aim)
    }
}
