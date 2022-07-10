//
//  Budget+CoreDataProperties.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//
//

import Foundation
import CoreData


extension Budget {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Budget> {
        return NSFetchRequest<Budget>(entityName: "Budget")
    }

    @NSManaged public var wallet: Account
    @NSManaged public var sum: Int64
    @NSManaged public var date: Date
    @NSManaged public var period: Period
    @NSManaged public var category: Category

}

extension Budget : Identifiable {

}
