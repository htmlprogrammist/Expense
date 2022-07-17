//
//  SettingsRouter.swift
//  Expense
//
//  Created by Егор Бадмаев on 16.07.2022.
//

import UIKit

protocol SettingsRouterProtocol: AnyObject {
}

final class SettingsRouter: SettingsRouterProtocol {
    weak var viewController: UIViewController?
}
