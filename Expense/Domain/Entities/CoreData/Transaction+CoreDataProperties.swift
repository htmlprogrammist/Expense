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

    @NSManaged public var wallet: Account
    @NSManaged public var sum: Int64
    @NSManaged public var date: Date
    @NSManaged public var isExpense: Bool
    @NSManaged public var repeats: Period
    @NSManaged public var notes: String?
    @NSManaged public var category: Category?
    @NSManaged public var goal: Goal?

}

extension Transaction : Identifiable {

}
