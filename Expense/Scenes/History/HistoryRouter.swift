//
//  HistoryRouter.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  
//


import UIKit

protocol HistoryRouterProtocol: AnyObject {
}

final class HistoryRouter: HistoryRouterProtocol {
    weak var viewController: UIViewController?
}
