//
//  AnalyticsRouter.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  
//


import UIKit

protocol AnalyticsRouterProtocol: AnyObject {
}

final class AnalyticsRouter: AnalyticsRouterProtocol {
    weak var viewController: UIViewController?
}
