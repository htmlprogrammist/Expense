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

    @NSManaged public var name: String
    @NSManaged public var current: Int64
    @NSManaged public var aim: Int64
    @NSManaged public var emoji: String
    @NSManaged public var dateCreated: Date
    @NSManaged public var dateDeadline: Date?

}
