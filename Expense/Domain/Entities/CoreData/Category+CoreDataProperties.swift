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

    @NSManaged public var account: Account
    @NSManaged public var name: String
    @NSManaged public var emoji: String
    @NSManaged public var budget: Budget?
    @NSManaged public var transactions: NSSet?

}

extension Category {
    var categoryInfo: CategoryInfo {
        CategoryInfo(account: account, name: name, emoji: Tagged(emoji))
    }
}

extension Category : Identifiable {

}
