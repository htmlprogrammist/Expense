//
//  Texts.swift
//  Expense
//
//  Created by Егор Бадмаев on 23.06.2022.
//

enum Texts {
    enum Home {
        static let title = "home".localized
        static let accounts = "accounts".localized
        static let balance = "balance".localized
        static let add = "add".localized
        static let addTransaction = "addTransaction".localized
        
        static let more = "more".localized
        static let scheduledOperations = "scheduledOperations".localized
        static let dailyBudget = "dailyBudget".localized
        static let goals = "goals".localized
        static let goalsDescription = "goalsDescription".localized
        static let budgets = "budgets".localized
        static let budgetsDescription = "budgetsDescription".localized
        static let seeAll = "seeAll".localized
    }
    
    enum History {
        static let title = "history".localized
        static let operationsBy = "operationsBy".localized
        static let day = "day".localized
        static let week = "week".localized
        static let month = "month".localized
        static let year = "year".localized
    }
    
    enum Analytics {
        static let title = "analytics".localized
    }
    
    enum Settings {
        static let title = "settings".localized
        static let managingWallets = "managingWallets".localized
    }
    
    /// Everything connected with transactions (adding, updating, etc.)
    enum Transactions {
        static let income = "income".localized
        static let expense = "expense".localized
        static let sum = "sum".localized
        static let category = "category".localized
        static let date = "date".localized
        static let note = "note".localized
        static let repeats = "repeats".localized
        static let repeatsDescription = "repeatsDescription".localized
    }
    
    enum EmojiPicker {
        static let emotionsAndPeople = "emotionsAndPeople".localized
        static let animalsAndNature = "animalsAndNature".localized
        static let foodAndDrinks = "foodAndDrinks".localized
        static let activities = "activities".localized
        static let travellingAndPlaces = "travellingAndPlaces".localized
        static let objects = "objects".localized
        static let symbols = "symbols".localized
        static let flags = "flags".localized
    }
}
