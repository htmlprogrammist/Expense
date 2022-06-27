//
//  Period.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

/// Describes periods of time. Defined with `@objc` to allow it to be used with `@NSManaged`.
@objc public enum Period: Int32 {
    case day
    case week
    case month
    case year
    case none // used in `repeatEvery` in Transaction
}
