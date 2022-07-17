//
//  HistoryAssembly.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  
//

import UIKit

final class HistoryAssembly {
    let presenter: HistoryPresenterProtocol
    let viewController: UIViewController
    private(set) weak var router: HistoryRouterProtocol!
    
    static func assemble(moduleOutput: HistoryModuleOutputProtocol?) -> HistoryAssembly {
        let router = HistoryRouter()
        let presenter = HistoryPresenter(router: router)
        let viewController = HistoryViewController(presenter: presenter)
        router.viewController = viewController
        
        presenter.view = viewController
        presenter.moduleOutput = moduleOutput
        
        return HistoryAssembly(view: viewController, presenter: presenter, router: router)
    }
    
    private init(view: UIViewController, presenter: HistoryPresenterProtocol, router: HistoryRouterProtocol) {
        self.viewController = view
        self.presenter = presenter
        self.router = router
    }
}
