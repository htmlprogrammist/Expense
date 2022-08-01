//
//  AppCoordinator.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import UIKit

final class AppCoordinator {
    
    // MARK: - Private Properties
    
    /// `UIWindow` of the application, provided from the SceneDelegate
    private let window: UIWindow
    /// Root view controller of the application
    private let tabBarController = UITabBarController()
    /// View controllers to set in the tab bar controller
    private var viewControllers = [UIViewController]()
    
    // MARK: - Init
    
    init(window: UIWindow) {
        self.window = window
    }
    
    /// This method setup tab bar controller with 3 modules and set root view controller for the `UIWindow`
    func start() {
        setupHome()
        setupHistory()
        setupAnalytics()
        tabBarController.setViewControllers(viewControllers, animated: false)
        
        window.rootViewController = tabBarController
        window.tintColor = .appColor
        window.makeKeyAndVisible()
    }
}

// MARK: - Helper methods

private extension AppCoordinator {
    func setupHome() {
        let assembly = HomeAssembly.assemble(moduleOutput: nil)
        let homeViewController = createNavController(viewController: assembly.viewController, itemName: Texts.Home.title, itemImage: Images.TabBarItems.home)
        viewControllers.append(homeViewController)
    }
    
    func setupHistory() {
        let assembly = HistoryAssembly.assemble(moduleOutput: nil)
        let historyViewController = createNavController(viewController: assembly.viewController, itemName: Texts.History.title, itemImage: Images.TabBarItems.history)
        viewControllers.append(historyViewController)
    }
    
    func setupAnalytics() {
        let assembly = AnalyticsAssembly.assemble(moduleOutput: nil)
        let analyticsViewController = createNavController(viewController: assembly.viewController, itemName: Texts.Analytics.title, itemImage: Images.TabBarItems.analytics)
        viewControllers.append(analyticsViewController)
    }
    
    /// Creates navigation controller and set tab bar item to it
    func createNavController(viewController: UIViewController, itemName: String, itemImage: UIImage?) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem = UITabBarItem(title: itemName, image: itemImage, tag: 0)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}
