//
//  OnboardingRouter.swift
//  Expense
//
//  Created by Егор Бадмаев on 21.07.2022.
//  
//

import UIKit

protocol OnboardingRouterProtocol: AnyObject {
}

final class OnboardingRouter: OnboardingRouterProtocol {
    weak var viewController: UIViewController?
}
