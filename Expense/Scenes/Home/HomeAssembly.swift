//
//  HomeAssembly.swift
//  Expense
//
//  Created by Егор Бадмаев on 16.07.2022.
//

import UIKit

final class HomeAssembly {
    let presenter: HomePresenterProtocol
    let viewController: UIViewController
    private(set) weak var router: HomeRouterProtocol!
    
    static func assemble(moduleOutput: HomeModuleOutputProtocol?) -> HomeAssembly {
        let router = HomeRouter()
        let presenter = HomePresenter(router: router)
        let viewController = HomeViewController(presenter: presenter)
        router.viewController = viewController
        
        presenter.view = viewController
        presenter.moduleOutput = moduleOutput
        
        return HomeAssembly(view: viewController, presenter: presenter, router: router)
    }
    
    private init(view: UIViewController, presenter: HomePresenterProtocol, router: HomeRouterProtocol) {
        self.viewController = view
        self.presenter = presenter
        self.router = router
    }
}
