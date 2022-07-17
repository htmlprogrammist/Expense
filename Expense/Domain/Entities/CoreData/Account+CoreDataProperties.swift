//
//  Account+CoreDataProperties.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Wallet")
    }

    @NSManaged public var name: String
    @NSManaged public var emoji: String
    @NSManaged public var balance: Double
    @NSManaged public var currency: Currency
    @NSManaged public var date: Date
    @NSManaged public var transactions: NSSet?
    @NSManaged public var budgets: NSOrderedSet?
    @NSManaged public var goals: NSOrderedSet?
    @NSManaged public var categories: NSOrderedSet?

}

extension Account {
    var accountInfo: AccountInfo {
        AccountInfo(name: name, emoji: Tagged(emoji), balance: balance, currency: currency, transactions: transactions, categories: categories, goals: goals, budgets: budgets)
    }
}

// MARK: Generated accessors for transactions
extension Account {

    @objc(addTransactionsObject:)
    @NSManaged public func addToTransactions(_ value: Transaction)

    @objc(removeTransactionsObject:)
    @NSManaged public func removeFromTransactions(_ value: Transaction)

    @objc(addTransactions:)
    @NSManaged public func addToTransactions(_ values: NSSet)

    @objc(removeTransactions:)
    @NSManaged public func removeFromTransactions(_ values: NSSet)

}

// MARK: Generated accessors for budgets
extension Account {

    @objc(addBudgetsObject:)
    @NSManaged public func addToBudgets(_ value: Budget)

    @objc(removeBudgetsObject:)
    @NSManaged public func removeFromBudgets(_ value: Budget)

    @objc(addBudgets:)
    @NSManaged public func addToBudgets(_ values: NSSet)

    @objc(removeBudgets:)
    @NSManaged public func removeFromBudgets(_ values: NSSet)

}

// MARK: Generated accessors for goals
extension Account {

    @objc(addGoalsObject:)
    @NSManaged public func addToGoals(_ value: Goal)

    @objc(removeGoalsObject:)
    @NSManaged public func removeFromGoals(_ value: Goal)

    @objc(addGoals:)
    @NSManaged public func addToGoals(_ values: NSSet)

    @objc(removeGoals:)
    @NSManaged public func removeFromGoals(_ values: NSSet)

}

// MARK: Generated accessors for categories
extension Account {

    @objc(addCategoriesObject:)
    @NSManaged public func addToCategories(_ value: Category)

    @objc(removeCategoriesObject:)
    @NSManaged public func removeFromCategories(_ value: Category)

    @objc(addCategories:)
    @NSManaged public func addToCategories(_ values: NSSet)

    @objc(removeCategories:)
    @NSManaged public func removeFromCategories(_ values: NSSet)

}

extension Account : Identifiable {

}
