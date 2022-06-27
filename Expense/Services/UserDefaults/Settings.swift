//
//  Settings.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

fileprivate enum SettingsKey: CodingKey {
    case dailyBudget
    case showGoals
    case showBudgets
}

struct Settings {
    private let storage = UserDefaultsContainer(keyedBy: SettingsKey.self)
    
    /// Defines whether to compute and display the daily budget
    var dailyBudget: Bool? {
        get { storage[.dailyBudget] }
        set { storage[.dailyBudget] = newValue }
    }
    /// Defines whether to show or not _Goals_ section in the main screen
    var showGoals: Bool? {
        get { storage[.showGoals] }
        set { storage[.showGoals] = newValue }
    }
    /// Defines whether to show or not _Budget_ section in the main screen
    var showBudgets: Bool? {
        get { storage[.showBudgets] }
        set { storage[.showBudgets] = newValue }
    }
}
