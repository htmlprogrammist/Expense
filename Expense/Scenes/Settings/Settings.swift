//
//  Settings.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import Foundation

fileprivate enum SettingsKey: CodingKey {
    // Home
    case showGoals
    case showBudgets
    
    case accounts
    case roundingNumbers
}

final class Settings {
    /// Singleton is being used so there will be no need to create instance of this structure and create `UserDefaultsContainer` instance
    static let shared = Settings()
    /// User defaults container that allows easily usage of UserDefaults
    private let storage = UserDefaultsContainer(keyedBy: SettingsKey.self)
    
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
    
    /// All numbers in the app will be rounded to an integer
    var roundingNumbers: Bool? {
        get { storage[.roundingNumbers] }
        set { storage[.roundingNumbers] = newValue }
    }
    
    /// The order of the accounts
    var accounts: [String]? {
        get { storage[.accounts] }
        set { storage[.accounts] = newValue }
    }
}
