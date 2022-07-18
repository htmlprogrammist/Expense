//
//  TransactionDetailsAssembly.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  

import UIKit

final class TransactionDetailsAssembly {
    let presenter: TransactionDetailsPresenterProtocol
    let viewController: UIViewController
    private(set) weak var router: TransactionDetailsRouterProtocol!
    
    static func assemble(moduleOutput: TransactionDetailsModuleOutputProtocol?) -> TransactionDetailsAssembly {
        let router = TransactionDetailsRouter()
        let presenter = TransactionDetailsPresenter(router: router)
        let viewController = TransactionDetailsViewController(presenter: presenter)
        router.viewController = viewController
        
        presenter.view = viewController
        presenter.moduleOutput = moduleOutput
        
        return TransactionDetailsAssembly(view: viewController, presenter: presenter, router: router)
    }
    
    private init(view: UIViewController, presenter: TransactionDetailsPresenterProtocol, router: TransactionDetailsRouterProtocol) {
        self.viewController = view
        self.presenter = presenter
        self.router = router
    }
}
