//
//  CoreDataManager.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import CoreData

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
    }
    
    func saveContext() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
