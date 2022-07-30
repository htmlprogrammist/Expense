//
//  UserDefaults.swift
//  Expense
//
//  Created by Егор Бадмаев on 30.07.2022.
//

import Foundation

extension UserDefaults {
    /// Defines whether to show or not _Goals_ section in the main screen
    @UserDefault(key: "showGoals", defaultValue: true)
    static var showGoals: Bool
    
    /// Defines whether to show or not _Budget_ section in the main screen
    @UserDefault(key: "showBudgets", defaultValue: true)
    static var showBudgets: Bool
    
    /// Defines whether to show or not daily budget
    @UserDefault(key: "showDailyBudget", defaultValue: true)
    static var showDailyBudget: Bool
    
    /// All numbers in the app will be rounded to an integer
    @UserDefault(key: "roundingNumbers", defaultValue: true)
    static var roundingNumbers: Bool
    
    /// The order of the accounts
    @UserDefault(key: "accounts", defaultValue: [String]())
    static var accounts: [String]
    
    /// Defines whether the user has onboarded or not
    @UserDefault(key: "isOnboarded", defaultValue: false)
    static var isOnboarded: Bool
}
