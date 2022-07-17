//
//  HomePresenter.swift
//  Expense
//
//  Created by Егор Бадмаев on 16.07.2022.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    func openSettings()
    func addTransaction()
}

protocol HomeModuleOutputProtocol: AnyObject {
}

final class HomePresenter {
    weak var view: HomeViewProtocol?
    weak var moduleOutput: HomeModuleOutputProtocol?
    
    private let router: HomeRouterProtocol
    
    init(router: HomeRouterProtocol) {
        self.router = router
    }
}

extension HomePresenter: HomePresenterProtocol {
    func openSettings() {
        router.openSettingsModule(moduleOutput: self)
    }
    
    func addTransaction() {
        router.openAddTransactionModule(moduleOutput: nil)
    }
}

extension HomePresenter: SettingsModuleOutputProtocol {
}
