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

    @NSManaged public var account: Account
    @NSManaged public var current: Double
    @NSManaged public var sum: Double
    @NSManaged public var date: Date
    @NSManaged public var period: Period
    @NSManaged public var category: Category

}

extension Budget {
    var budgetInfo: BudgetInfo {
        BudgetInfo(account: account, current: current, sum: sum, period: period, category: category, date: date)
    }
}

extension Budget : Identifiable {

}
