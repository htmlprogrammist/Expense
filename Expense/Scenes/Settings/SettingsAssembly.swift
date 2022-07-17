//
//  SettingsAssembly.swift
//  Expense
//
//  Created by Егор Бадмаев on 16.07.2022.
//

import UIKit

final class SettingsAssembly {
    let presenter: SettingsPresenterProtocol
    let viewController: UIViewController
    private(set) weak var router: SettingsRouterProtocol!
    
    static func assemble(moduleOutput: SettingsModuleOutputProtocol?) -> SettingsAssembly {
        let router = SettingsRouter()
        let presenter = SettingsPresenter(router: router)
        let viewController = SettingsViewController(presenter: presenter)
        router.navigationController = viewController.navigationController
        
        presenter.view = viewController
        presenter.moduleOutput = moduleOutput
        
        return SettingsAssembly(view: viewController, presenter: presenter, router: router)
    }
    
    private init(view: UIViewController, presenter: SettingsPresenterProtocol, router: SettingsRouterProtocol) {
        self.viewController = view
        self.presenter = presenter
        self.router = router
    }
}
