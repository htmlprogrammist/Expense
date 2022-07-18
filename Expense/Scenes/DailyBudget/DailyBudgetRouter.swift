//
//  DailyBudgetRouter.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  

import UIKit

protocol DailyBudgetRouterProtocol: AnyObject {
}

final class DailyBudgetRouter: DailyBudgetRouterProtocol {
    weak var viewController: UIViewController?
}
