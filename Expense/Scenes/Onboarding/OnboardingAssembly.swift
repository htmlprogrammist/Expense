//
//  OnboardingAssembly.swift
//  Expense
//
//  Created by Егор Бадмаев on 21.07.2022.
//  
//

import UIKit

final class OnboardingAssembly {
    let presenter: OnboardingPresenterProtocol
    let viewController: UIViewController
    private(set) weak var router: OnboardingRouterProtocol!
    
    static func assemble(moduleOutput: OnboardingModuleOutputProtocol?) -> OnboardingAssembly {
        let router = OnboardingRouter()
        let presenter = OnboardingPresenter(router: router)
        let viewController = OnboardingViewController(presenter: presenter)
        router.viewController = viewController
        
        presenter.view = viewController
        presenter.moduleOutput = moduleOutput
        
        return OnboardingAssembly(view: viewController, presenter: presenter, router: router)
    }
    
    private init(view: UIViewController, presenter: OnboardingPresenterProtocol, router: OnboardingRouterProtocol) {
        self.viewController = view
        self.presenter = presenter
        self.router = router
    }
}
