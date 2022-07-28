//
//  SettingsPresenter.swift
//  Expense
//
//  Created by Егор Бадмаев on 16.07.2022.
//

import Foundation

protocol SettingsPresenterProtocol: AnyObject {
    var moduleOutput: SettingsModuleOutputProtocol? { get set }
}

protocol SettingsModuleOutputProtocol: AnyObject {
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
}
