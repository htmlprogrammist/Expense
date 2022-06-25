//
//  AppDelegate.swift
//  Expense
//
//  Created by Егор Бадмаев on 04.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private var coordinator: AppCoordinator?
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = AppCoordinator(window: window)
        coordinator?.start()
        self.window = window
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        coordinator?.coreDataManager.saveContext()
    }
}
