//
//  Settings.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

fileprivate enum SettingsKey: CodingKey {
    // Home
    case dailyBudget
    case showGoals
    case showBudgets
    
    // History
    case hideAddTransactionButtonInHistory
}

class Settings {
    /// Singleton is being used so there will be no need to create instance of this structure and create `UserDefaultsContainer` instance
    static let shared = Settings()
    /// User defaults container that allows easily usage of UserDefaults
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
    
    /// Defines whether to hide or not "+ Add transaction" button ih "History" module
    var hideAddTransactionButtonInHistory: Bool? {
        get { storage[.hideAddTransactionButtonInHistory] }
        set { storage[.hideAddTransactionButtonInHistory] = newValue }
    }
}
