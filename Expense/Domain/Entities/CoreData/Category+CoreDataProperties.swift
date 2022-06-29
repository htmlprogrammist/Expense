//
//  Category+CoreDataProperties.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var wallet: Wallet
    @NSManaged public var name: String
    @NSManaged public var emoji: String
    @NSManaged public var budget: Budget?
    @NSManaged public var transactions: NSSet?

}

extension Category : Identifiable {

}
