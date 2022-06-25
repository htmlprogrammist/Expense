//
//  CoreDataManager.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import CoreData
import UIKit

protocol CoreDataManagerProtocol {
    
}

final class CoreDataManager: CoreDataManagerProtocol {
    let managedObjectContext: NSManagedObjectContext
    let persistentContainer: NSPersistentContainer
    
    init(containerName: String) {
        persistentContainer = NSPersistentContainer(name: containerName)
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.localizedDescription)")
            }
        })
        managedObjectContext = persistentContainer.newBackgroundContext()
        /// Subscribe to Notification center so CoreDataManager will save context when app enters background
        NotificationCenter.default.addObserver(self, selector: #selector(saveContext), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    
    deinit {
        /// Unsubscribe from notification center when Core Data manager deinits
        NotificationCenter.default.removeObserver(self, name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    
    @objc
    private func saveContext() {
//        if managedObjectContext.hasChanges {
//            do {
//                try managedObjectContext.save()
//            } catch {
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
    }
}
