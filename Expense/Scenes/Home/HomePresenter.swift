//
//  HomePresenter.swift
//  Expense
//
//  Created by Егор Бадмаев on 16.07.2022.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    var moduleOutput: HomeModuleOutputProtocol? { get set }
    
    func openSettings()
    func addTransaction()
}

protocol HomeModuleOutputProtocol: AnyObject {
}

final class HomePresenter: HomePresenterProtocol {
    
    // MARK: - Public properties
    weak var view: HomeViewProtocol?
    weak var moduleOutput: HomeModuleOutputProtocol?
    
    // MARK: - Private properties
    private let router: HomeRouterProtocol
    private var account: Account! {
        didSet {
            // TODO: Обновить цели и бюджеты для этого аккаунта
        }
    }
    
    init(router: HomeRouterProtocol) {
        self.router = router
    }
    
    func openSettings() {
        router.openSettingsModule(moduleOutput: nil)
    }
    
    func addTransaction() {
        router.openAddTransactionModule(account: account)
    }
}
