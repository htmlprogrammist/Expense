//
//  Settings.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import Foundation

fileprivate enum SettingsKey: CodingKey {
    case showDailyBudget
    case accounts
    case roundingNumbers
}

final class Settings {
    /// Singleton is being used so there will be no need to create instance of this structure and create `UserDefaultsContainer` instance
    static let shared = Settings()
    /// User defaults container that allows easily usage of UserDefaults
    private let storage = UserDefaultsContainer(keyedBy: SettingsKey.self)
    
    /// Defines whether to show or not daily budget
    var showDailyBudget: Bool? {
        get { storage[.showDailyBudget] }
        set { storage[.showDailyBudget] = newValue }
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
