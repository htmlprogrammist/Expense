//
//  DailyBudgetAssembly.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  

import UIKit

final class DailyBudgetAssembly {
    let presenter: DailyBudgetPresenterProtocol
    let viewController: UIViewController
    private(set) weak var router: DailyBudgetRouterProtocol!
    
    static func assemble(moduleOutput: DailyBudgetModuleOutputProtocol?) -> DailyBudgetAssembly {
        let router = DailyBudgetRouter()
        let presenter = DailyBudgetPresenter(router: router)
        let viewController = DailyBudgetViewController(presenter: presenter)
        router.viewController = viewController
        
        presenter.view = viewController
        presenter.moduleOutput = moduleOutput
        
        return DailyBudgetAssembly(view: viewController, presenter: presenter, router: router)
    }
    
    private init(view: UIViewController, presenter: DailyBudgetPresenterProtocol, router: DailyBudgetRouterProtocol) {
        self.viewController = view
        self.presenter = presenter
        self.router = router
    }
}
