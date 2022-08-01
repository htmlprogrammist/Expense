//
//  GoalInfo.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import Foundation

struct GoalInfo {
    let account: Account
    let name: String
    let emoji: String
    let aim: Double
    let dateCreated: Date
    let dateDeadline: Date?
    var current: Double = 0
}
