//
//  OnboardingPresenter.swift
//  Expense
//
//  Created by Егор Бадмаев on 21.07.2022.
//  
//

import Foundation

protocol OnboardingPresenterProtocol: AnyObject {
}

protocol OnboardingModuleOutputProtocol: AnyObject {
}

final class OnboardingPresenter: OnboardingPresenterProtocol {
    weak var view: OnboardingViewProtocol?
    weak var moduleOutput: OnboardingModuleOutputProtocol?
    
    private let router: OnboardingRouterProtocol
    
    init(router: OnboardingRouterProtocol) {
        self.router = router
    }
}
