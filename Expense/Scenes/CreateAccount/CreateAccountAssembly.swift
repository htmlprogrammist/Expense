//
//  CreateAccountAssembly.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  

import UIKit

final class CreateAccountAssembly {
    let presenter: CreateAccountPresenterProtocol
    let viewController: UIViewController
    private(set) weak var router: CreateAccountRouterProtocol!
    
    static func assemble(moduleOutput: CreateAccountModuleOutputProtocol?) -> CreateAccountAssembly {
        let router = CreateAccountRouter()
        let presenter = CreateAccountPresenter(router: router)
        let viewController = CreateAccountViewController(presenter: presenter)
        router.viewController = viewController
        
        presenter.view = viewController
        presenter.moduleOutput = moduleOutput
        
        return CreateAccountAssembly(view: viewController, presenter: presenter, router: router)
    }
    
    private init(view: UIViewController, presenter: CreateAccountPresenterProtocol, router: CreateAccountRouterProtocol) {
        self.viewController = view
        self.presenter = presenter
        self.router = router
    }
}
