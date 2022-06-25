//
//  CoreDataManager.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import CoreData

protocol WalletsCoreDataManagerProtocol {
    func fetchWallets() -> [Wallet]?
    func createWallet(with data: BaseInfo)
    func deleteWallet(_ wallet: Wallet)
}

protocol TransactionsCoreDataManagerProtocol {
    func fetchTransactions() -> [Transaction]?
    func fetchPlannedTransactions() -> [Transaction]?
    
    func createTransaction(with data: TransactionInfo)
    func deleteTransaction(_ transaction: Transaction)
}

protocol CategoriesCoreDataManagerProtocol {
    func fetchCategories() -> [Category]?
    func createCategory(with data: BaseInfo)
    func deleteCategory(_ category: Category)
}

protocol GoalsCoreDataManagerProtocol {
    func fetchGoals() -> [Goal]?
    func createGoal(with data: GoalInfo)
    func deleteGoal(_ goal: Goal)
}

protocol BudgetsCoreDataManagerProtocol {
    func fetchBudgets() -> [Budget]?
    func createBudget(with data: BudgetInfo)
    func deleteBudget(_ budget: Budget)
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
    
    func createWallet(with data: BaseInfo) {
        let wallet = Wallet(context: managedObjectContext)
        wallet.emoji = data.emoji
        wallet.name = data.name
        saveContext()
    }
    
    func deleteWallet(_ wallet: Wallet) {
        managedObjectContext.delete(wallet)
        saveContext()
    }
}

// MARK: - Transactions
extension CoreDataManager: TransactionsCoreDataManagerProtocol {
    /// Fetches all past transactions
    func fetchTransactions() -> [Transaction]? {
        let fetchRequest = Transaction.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date < %@", Date() as CVarArg)
        let sortDescriptor = NSSortDescriptor(key: #keyPath(Transaction.date), ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let transactions = try? managedObjectContext.fetch(fetchRequest)
        return transactions
    }
    
    /// Fetches transactions that have `date` > `Date.now()`
    func fetchPlannedTransactions() -> [Transaction]? {
        let fetchRequest = Transaction.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date > %@", Date() as CVarArg)
        let sortDescriptor = NSSortDescriptor(key: #keyPath(Transaction.date), ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let transactions = try? managedObjectContext.fetch(fetchRequest)
        return transactions
    }
    
    func createTransaction(with data: TransactionInfo) {
        let transaction = Transaction(context: managedObjectContext)
        transaction.date = Date()
        transaction.wallet = data.wallet
        transaction.sum = Int64(data.sum)
        transaction.isExpense = data.isExpense
        transaction.category = data.category
        transaction.repeatEvery = data.repeatEvery?.rawValue as? NSDecimalNumber
        transaction.notes = data.notes
        saveContext()
    }
    
    func deleteTransaction(_ transaction: Transaction) {
        managedObjectContext.delete(transaction)
        saveContext()
    }
}

// MARK: - Categories
extension CoreDataManager: CategoriesCoreDataManagerProtocol {
    func fetchCategories() -> [Category]? {
        let categories = try? managedObjectContext.fetch(Category.fetchRequest())
        return categories
    }
    
    func createCategory(with data: BaseInfo) {
        let category = Category(context: managedObjectContext)
        category.emoji = data.emoji
        category.name = data.name
        saveContext()
    }
    
    func deleteCategory(_ category: Category) {
        managedObjectContext.delete(category)
        saveContext()
    }
}

// MARK: - Goals
extension CoreDataManager: GoalsCoreDataManagerProtocol {
    func fetchGoals() -> [Goal]? {
        let goals = try? managedObjectContext.fetch(Goal.fetchRequest())
        return goals
    }
    
    func createGoal(with data: GoalInfo) {
        
    }
    
    func deleteGoal(_ goal: Goal) {
        managedObjectContext.delete(goal)
        saveContext()
    }
}

// MARK: - Budgets
extension CoreDataManager: BudgetsCoreDataManagerProtocol {
    func fetchBudgets() -> [Budget]? {
        let budgets = try? managedObjectContext.fetch(Budget.fetchRequest())
        return budgets
    }
    
    func createBudget(with data: BudgetInfo) {
        
    }
    
    func deleteBudget(_ budget: Budget) {
        managedObjectContext.delete(budget)
        saveContext()
    }
}
