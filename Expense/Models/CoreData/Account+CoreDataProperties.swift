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
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var id: UUID
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
        AccountInfo(id: id, name: name, emoji: Tagged(emoji), balance: balance, currency: currency, transactions: transactions, categories: categories, goals: goals, budgets: budgets)
    }
}

// MARK: Generated accessors for budgets
extension Account {

    @objc(insertObject:inBudgetsAtIndex:)
    @NSManaged public func insertIntoBudgets(_ value: Budget, at idx: Int)

    @objc(removeObjectFromBudgetsAtIndex:)
    @NSManaged public func removeFromBudgets(at idx: Int)

    @objc(insertBudgets:atIndexes:)
    @NSManaged public func insertIntoBudgets(_ values: [Budget], at indexes: NSIndexSet)

    @objc(removeBudgetsAtIndexes:)
    @NSManaged public func removeFromBudgets(at indexes: NSIndexSet)

    @objc(replaceObjectInBudgetsAtIndex:withObject:)
    @NSManaged public func replaceBudgets(at idx: Int, with value: Budget)

    @objc(replaceBudgetsAtIndexes:withBudgets:)
    @NSManaged public func replaceBudgets(at indexes: NSIndexSet, with values: [Budget])

    @objc(addBudgetsObject:)
    @NSManaged public func addToBudgets(_ value: Budget)

    @objc(removeBudgetsObject:)
    @NSManaged public func removeFromBudgets(_ value: Budget)

    @objc(addBudgets:)
    @NSManaged public func addToBudgets(_ values: NSOrderedSet)

    @objc(removeBudgets:)
    @NSManaged public func removeFromBudgets(_ values: NSOrderedSet)

}

// MARK: Generated accessors for categories
extension Account {

    @objc(insertObject:inCategoriesAtIndex:)
    @NSManaged public func insertIntoCategories(_ value: Category, at idx: Int)

    @objc(removeObjectFromCategoriesAtIndex:)
    @NSManaged public func removeFromCategories(at idx: Int)

    @objc(insertCategories:atIndexes:)
    @NSManaged public func insertIntoCategories(_ values: [Category], at indexes: NSIndexSet)

    @objc(removeCategoriesAtIndexes:)
    @NSManaged public func removeFromCategories(at indexes: NSIndexSet)

    @objc(replaceObjectInCategoriesAtIndex:withObject:)
    @NSManaged public func replaceCategories(at idx: Int, with value: Category)

    @objc(replaceCategoriesAtIndexes:withCategories:)
    @NSManaged public func replaceCategories(at indexes: NSIndexSet, with values: [Category])

    @objc(addCategoriesObject:)
    @NSManaged public func addToCategories(_ value: Category)

    @objc(removeCategoriesObject:)
    @NSManaged public func removeFromCategories(_ value: Category)

    @objc(addCategories:)
    @NSManaged public func addToCategories(_ values: NSOrderedSet)

    @objc(removeCategories:)
    @NSManaged public func removeFromCategories(_ values: NSOrderedSet)

}

// MARK: Generated accessors for goals
extension Account {

    @objc(insertObject:inGoalsAtIndex:)
    @NSManaged public func insertIntoGoals(_ value: Goal, at idx: Int)

    @objc(removeObjectFromGoalsAtIndex:)
    @NSManaged public func removeFromGoals(at idx: Int)

    @objc(insertGoals:atIndexes:)
    @NSManaged public func insertIntoGoals(_ values: [Goal], at indexes: NSIndexSet)

    @objc(removeGoalsAtIndexes:)
    @NSManaged public func removeFromGoals(at indexes: NSIndexSet)

    @objc(replaceObjectInGoalsAtIndex:withObject:)
    @NSManaged public func replaceGoals(at idx: Int, with value: Goal)

    @objc(replaceGoalsAtIndexes:withGoals:)
    @NSManaged public func replaceGoals(at indexes: NSIndexSet, with values: [Goal])

    @objc(addGoalsObject:)
    @NSManaged public func addToGoals(_ value: Goal)

    @objc(removeGoalsObject:)
    @NSManaged public func removeFromGoals(_ value: Goal)

    @objc(addGoals:)
    @NSManaged public func addToGoals(_ values: NSOrderedSet)

    @objc(removeGoals:)
    @NSManaged public func removeFromGoals(_ values: NSOrderedSet)

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

extension Account : Identifiable {

}
