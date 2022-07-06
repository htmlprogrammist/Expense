//
//  AppCoordinator.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import UIKit

final class AppCoordinator: NSObject {
    /// Service is used for using Core Data in the project. It is `public` because it is being used in AppDelegate - when app enters background, Core Data manager will _save context_
    public let coreDataManager = CoreDataManager(containerName: "Expense")
    
    /// `UIWindow` of the application, provided from the SceneDelegate
    private let window: UIWindow
    /// Root view controller of the application
    private let tabBarController = UITabBarController()
    /// View controllers to set in the tab bar controller
    private var viewControllers = [UIViewController]()
    
    /// Add transaction button
    private lazy var addTransactionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = UIColor(named: "AccentColor")
        button.setImage(Images.Home.add, for: .normal)
        button.addTarget(self, action: #selector(addTransaction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    /// This method setup tab bar controller with 3 modules and set root view controller for the `UIWindow`
    func start() {
        setupHome()
        setupAnalytics()
        setupEmptyViewController()
        setupHistory()
        setupSettings()
        tabBarController.setViewControllers(viewControllers, animated: false)
        tabBarController.delegate = self
        
        window.rootViewController = tabBarController
        window.tintColor = UIColor(named: "AccentColor")
        window.makeKeyAndVisible()
        
        /// Setup tab bar appearence like in earlier versions of iOS, because in iOS 15 it does not look good
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .systemBackground
            tabBarController.tabBar.standardAppearance = appearance
            tabBarController.tabBar.scrollEdgeAppearance = appearance
        }
        tabBarController.tabBar.addSubview(addTransactionButton)
        addTransactionButton.layer.cornerRadius = tabBarController.tabBar.frame.size.width * (1/12)
        NSLayoutConstraint.activate([
            addTransactionButton.centerXAnchor.constraint(equalTo: tabBarController.tabBar.centerXAnchor),
            addTransactionButton.bottomAnchor.constraint(equalTo: tabBarController.tabBar.bottomAnchor, constant: -8),
            addTransactionButton.heightAnchor.constraint(equalTo: tabBarController.tabBar.widthAnchor, multiplier: 1/6),
            addTransactionButton.widthAnchor.constraint(equalTo: tabBarController.tabBar.widthAnchor, multiplier: 1/6),
        ])
    }
}

extension AppCoordinator: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        if viewController is EmptyViewController {
//            return false
//        }
//        return true
//    }
}

private extension AppCoordinator {
    func setupHome() {
        let homeViewController = createNavController(viewController: HomeViewController(), itemName: Texts.Home.title, itemImage: Images.TabBarItems.home)
        viewControllers.append(homeViewController)
    }
    
    func setupAnalytics() {
        let analyticsViewController = createNavController(viewController: AnalyticsViewController(), itemName: Texts.Analytics.title, itemImage: Images.TabBarItems.analytics)
        viewControllers.append(analyticsViewController)
    }
    
    func setupEmptyViewController() {
        viewControllers.append(EmptyViewController())
    }
    
    func setupHistory() {
        let historyViewController = createNavController(viewController: HistoryViewController(), itemName: Texts.History.title, itemImage: Images.TabBarItems.history)
        viewControllers.append(historyViewController)
    }
    
    func setupSettings() {
        let settingsViewController = createNavController(viewController: SettingsViewController(), itemName: Texts.Settings.title, itemImage: Images.TabBarItems.settings)
        viewControllers.append(settingsViewController)
    }
    
    @objc func addTransaction() {
        tabBarController.present(AddTransactionViewController(), animated: true)
    }
    
    /// Creates navigation controller and set tab bar item to it
    func createNavController(viewController: UIViewController, itemName: String, itemImage: UIImage?) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem = UITabBarItem(title: itemName, image: itemImage, tag: 0)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}

final class EmptyViewController: UIViewController {}
