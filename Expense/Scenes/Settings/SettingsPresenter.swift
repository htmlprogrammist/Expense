//
//  SettingsPresenter.swift
//  Expense
//
//  Created by Егор Бадмаев on 16.07.2022.
//

import Foundation

protocol SettingsPresenterProtocol: AnyObject {
    func provideIndexPath(_ indexPath: IndexPath)
}

protocol SettingsModuleOutputProtocol: AnyObject {
    func recieveIndexPath(_ indexPath: IndexPath)
}

final class SettingsPresenter {
    weak var view: SettingsViewProtocol?
    weak var moduleOutput: SettingsModuleOutputProtocol?
    
    private let router: SettingsRouterProtocol
    
    init(router: SettingsRouterProtocol) {
        self.router = router
    }
}

extension SettingsPresenter: SettingsPresenterProtocol {
    func provideIndexPath(_ indexPath: IndexPath) {
        moduleOutput?.recieveIndexPath(indexPath)
    }
}
