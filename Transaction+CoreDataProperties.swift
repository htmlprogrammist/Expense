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

    @NSManaged public var sum: Int64
    @NSManaged public var date: Date
    @NSManaged public var notes: String?
    @NSManaged public var repeatEvery: NSDecimalNumber?
    @NSManaged public var isExpense: Bool
    @NSManaged public var wallet: Wallet
    @NSManaged public var category: Category

}
