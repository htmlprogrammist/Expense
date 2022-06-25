//
//  CoreDataManager.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import CoreData

protocol WalletsCoreDataManagerProtocol {
    func fetchWallets() -> [Wallet]?
    func createWallet()
    func deleteWallet()
}

/// Operations contains everything connected with _Transaction_ and _Category_, because they always go side-by-side
protocol OperationsCoreDataManagerProtocol {
    func fetchTransactions() -> [Transaction]?
    func fetchPlannedTransactions()
    func fetchCategories()
    
    func createTransaction()
    func deleteTransaction()
}

protocol GoalsCoreDataManagerProtocol {
    func fetchGoals() -> [Goal]?
    func createGoal()
    func deleteGoal()
}

protocol BudgetsCoreDataManagerProtocol {
    func fetchBudgets() -> [Budget]?
    func createBudget()
    func deleteBudget()
}

final class CoreDataManager {
    
    private let managedObjectContext: NSManagedObjectContext
    private let persistentContainer: NSPersistentContainer
    
    public init(containerName: String) {
        persistentContainer = NSPersistentContainer(name: containerName)
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.localizedDescription)")
            }
        })
        managedObjectContext = persistentContainer.newBackgroundContext()
    }
    
    public func saveContext() {
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

// MARK: - Wallets
extension CoreDataManager: WalletsCoreDataManagerProtocol {
    func fetchWallets() -> [Wallet]? {
        let wallets = try? managedObjectContext.fetch(Wallet.fetchRequest())
        return wallets
    }
    
    func createWallet() {
        
    }
    
    func deleteWallet() {
        
    }
}

// MARK: - Operations
extension CoreDataManager: OperationsCoreDataManagerProtocol {
    /// Fetches all past transactions
    func fetchTransactions() -> [Transaction]? {
        let transactions = try? managedObjectContext.fetch(Transaction.fetchRequest())
        return transactions
    }
    
    /// Fetches transactions that have `date` > `Date.now()`
    func fetchPlannedTransactions() {
        
    }
    
    // TODO: Не забыть не делать fetch объекта с именем "Unknown" (достигается через NSPredicate)
    func fetchCategories() {
        
    }
    
    func createTransaction() {
        
    }
    
    func deleteTransaction() {
        
    }
}

// MARK: - Goals
extension CoreDataManager: GoalsCoreDataManagerProtocol {
    func fetchGoals() -> [Goal]? {
        let goals = try? managedObjectContext.fetch(Goal.fetchRequest())
        return goals
    }
    
    func createGoal() {
        
    }
    
    func deleteGoal() {
        
    }
}

// MARK: - Budgets
extension CoreDataManager: BudgetsCoreDataManagerProtocol {
    func fetchBudgets() -> [Budget]? {
        let budgets = try? managedObjectContext.fetch(Budget.fetchRequest())
        return budgets
    }
    
    func createBudget() {
        
    }
    
    func deleteBudget() {
        
    }
}
