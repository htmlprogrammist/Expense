//
//  TransactionDetailsRouter.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  


import UIKit

protocol TransactionDetailsRouterProtocol: AnyObject {
}

final class TransactionDetailsRouter: TransactionDetailsRouterProtocol {
    weak var viewController: UIViewController?
}
