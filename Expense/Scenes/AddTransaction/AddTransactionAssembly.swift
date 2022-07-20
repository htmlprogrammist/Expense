//
//  AddTransactionAssembly.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  

import UIKit

final class AddTransactionAssembly {
    let presenter: AddTransactionPresenterProtocol
    let viewController: UIViewController
    private(set) weak var router: AddTransactionRouterProtocol!
    
    static func assemble(account: Account) -> AddTransactionAssembly {
        let router = AddTransactionRouter()
        let presenter = AddTransactionPresenter(router: router)
        let viewController = AddTransactionViewController(presenter: presenter)
        router.viewController = viewController
        
        presenter.view = viewController
        presenter.account = account
        
        return AddTransactionAssembly(view: viewController, presenter: presenter, router: router)
    }
    
    private init(view: UIViewController, presenter: AddTransactionPresenterProtocol, router: AddTransactionRouterProtocol) {
        self.viewController = view
        self.presenter = presenter
        self.router = router
    }
}
