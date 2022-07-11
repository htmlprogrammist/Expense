//
//  Goal+CoreDataProperties.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var account: Account
    @NSManaged public var name: String
    @NSManaged public var emoji: String
    @NSManaged public var aim: Int64
    @NSManaged public var current: Int64
    @NSManaged public var dateCreated: Date
    @NSManaged public var dateDeadline: Date?
    @NSManaged public var transactions: NSSet?

}

// MARK: Generated accessors for transactions
extension Goal {

    @objc(addTransactionsObject:)
    @NSManaged public func addToTransactions(_ value: Transaction)

    @objc(removeTransactionsObject:)
    @NSManaged public func removeFromTransactions(_ value: Transaction)

    @objc(addTransactions:)
    @NSManaged public func addToTransactions(_ values: NSSet)

    @objc(removeTransactions:)
    @NSManaged public func removeFromTransactions(_ values: NSSet)

}

extension Goal : Identifiable {

}
