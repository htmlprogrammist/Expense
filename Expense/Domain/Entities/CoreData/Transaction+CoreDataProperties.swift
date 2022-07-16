//
//  Transaction+CoreDataProperties.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var account: Account
    @NSManaged public var sum: Double
    @NSManaged public var date: Date
    @NSManaged public var isExpense: Bool
    @NSManaged public var repeats: Period
    @NSManaged public var notes: String?
    @NSManaged public var category: Category?
    @NSManaged public var goal: Goal?

}

extension Transaction {
    var transactionInfo: TransactionInfo {
        TransactionInfo(account: account, sum: sum, isExpense: isExpense, date: date, category: category, goal: goal, notes: notes, repeats: repeats)
    }
}

extension Transaction : Identifiable {

}
