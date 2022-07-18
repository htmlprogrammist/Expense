//
//  AnalyticsAssembly.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  

import UIKit

final class AnalyticsAssembly {
    let presenter: AnalyticsPresenterProtocol
    let viewController: UIViewController
    private(set) weak var router: AnalyticsRouterProtocol!
    
    static func assemble(moduleOutput: AnalyticsModuleOutputProtocol?) -> AnalyticsAssembly {
        let router = AnalyticsRouter()
        let presenter = AnalyticsPresenter(router: router)
        let viewController = AnalyticsViewController(presenter: presenter)
        router.viewController = viewController
        
        presenter.view = viewController
        presenter.moduleOutput = moduleOutput
        
        return AnalyticsAssembly(view: viewController, presenter: presenter, router: router)
    }
    
    private init(view: UIViewController, presenter: AnalyticsPresenterProtocol, router: AnalyticsRouterProtocol) {
        self.viewController = view
        self.presenter = presenter
        self.router = router
    }
}
