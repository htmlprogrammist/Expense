//
//  Wallet+CoreDataProperties.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//
//

import Foundation
import CoreData


extension Wallet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Wallet> {
        return NSFetchRequest<Wallet>(entityName: "Wallet")
    }

    @NSManaged public var name: String
    @NSManaged public var emoji: String
    @NSManaged public var transactions: NSSet?

}

// MARK: Generated accessors for transactions
extension Wallet {

    @objc(addTransactionsObject:)
    @NSManaged public func addToTransactions(_ value: Transaction)

    @objc(removeTransactionsObject:)
    @NSManaged public func removeFromTransactions(_ value: Transaction)

    @objc(addTransactions:)
    @NSManaged public func addToTransactions(_ values: NSSet)

    @objc(removeTransactions:)
    @NSManaged public func removeFromTransactions(_ values: NSSet)

}
