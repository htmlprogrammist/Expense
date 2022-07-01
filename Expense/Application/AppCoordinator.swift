//
//  AppCoordinator.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import UIKit

final class AppCoordinator {
    /// Service is used for using Core Data in the project. It is `public` because it is being used in AppDelegate - when app enters background, Core Data manager will _save context_
    public let coreDataManager = CoreDataManager(containerName: "Expense")
    
    /// `UIWindow` of the application, provided from the SceneDelegate
    private let window: UIWindow
    /// Root view controller of the application
    private let tabBarController = UITabBarController()
    /// View controllers to set in the tab bar controller
    private var viewControllers = [UIViewController]()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    /// This method setup tab bar controller with 3 modules and set root view controller for the `UIWindow`
    func start() {
        setupHome()
        setupHistory()
        setupAnalytics()
        
        tabBarController.setViewControllers(viewControllers, animated: false)
        tabBarController.selectedIndex = 1
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        /// Setup tab bar appearence like in earlier versions of iOS, because in iOS 15 it does not look good
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .systemBackground
            tabBarController.tabBar.standardAppearance = appearance
            tabBarController.tabBar.scrollEdgeAppearance = appearance
        }
    }
}

private extension AppCoordinator {
    func setupHome() {
        let homeViewController = createNavController(viewController: HomeViewController(), itemName: Texts.Home.title, itemImage: Images.home)
        viewControllers.append(homeViewController)
    }
    
    func setupHistory() {
        let historyViewController = createNavController(viewController: HistoryViewController(), itemName: Texts.History.title, itemImage: Images.history)
        viewControllers.append(historyViewController)
    }
    
    func setupAnalytics() {
        let analyticsViewController = createNavController(viewController: AnalyticsViewController(), itemName: Texts.Analytics.title, itemImage: Images.analytics)
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
