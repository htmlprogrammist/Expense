//
//  NotificationName.swift
//  Expense
//
//  Created by Егор Бадмаев on 13.07.2022.
//

import Foundation

extension Notification.Name {
    static let didDeleteAccount = Notification.Name("didDeleteAccount")
}
/// example of usage: `NotificationCenter.default.post(name: .didDeleteAccount, object: self)`
