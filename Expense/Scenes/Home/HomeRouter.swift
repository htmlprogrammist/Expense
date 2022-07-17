//
//  HomeRouter.swift
//  Expense
//
//  Created by Егор Бадмаев on 16.07.2022.
//

import UIKit

protocol HomeRouterProtocol: AnyObject {
    func openSettingsModule(moduleOutput: SettingsModuleOutputProtocol?)
    func openAddTransactionModule(moduleOutput: AddTransactionModuleOutputProtocol?)
}

final class HomeRouter: HomeRouterProtocol {
    weak var viewController: UIViewController?
    
    func openSettingsModule(moduleOutput: SettingsModuleOutputProtocol?) {
        let assembly = SettingsAssembly.assemble(moduleOutput: moduleOutput)
        let navController = UINavigationController(rootViewController: assembly.viewController)
        navController.modalPresentationStyle = .fullScreen
        viewController?.present(navController, animated: true)
//        viewController?.navigationController?.pushViewController(assembly.viewController, animated: true)
    }
    
    func openAddTransactionModule(moduleOutput: AddTransactionModuleOutputProtocol?) {
        let assembly = AddTransactionAssembly.assemble(moduleOutput: moduleOutput)
        let navController = UINavigationController(rootViewController: assembly.viewController)
        if #available(iOS 15.0, *), let sheet = navController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        viewController?.present(navController, animated: true)
    }
}
