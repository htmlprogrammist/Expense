//
//  CoreDataManager.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import CoreData

protocol AccountsCoreDataManagerProtocol {
    func fetchAccounts() -> [Account]?
    func createAccount(with data: AccountInfo)
    func deleteAccount(_ wallet: Account)
}

protocol TransactionsCoreDataManagerProtocol {
    func fetchTransactions() -> [Transaction]?
    func fetchTransactions(by category: Category) -> [Transaction]?
//    func fetchTransactions(by goal: Goal) -> [Transaction]?
    func fetchPlannedTransactions() -> [Transaction]?
    
    func createTransaction(with data: TransactionInfo)
    func deleteTransaction(_ transaction: Transaction)
}

protocol CategoriesCoreDataManagerProtocol {
    func fetchCategories() -> [Category]?
    func createCategory(with data: CategoryInfo)
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
extension CoreDataManager: AccountsCoreDataManagerProtocol {
    func fetchAccounts() -> [Account]? {
        let wallets = try? managedObjectContext.fetch(Account.fetchRequest())
        return wallets
    }
    
    func createAccount(with data: AccountInfo) {
        let account = Account(context: managedObjectContext)
        account.emoji = data.emoji
        account.name = data.name
//        account.balance = 0
        saveContext()
    }
    
    func deleteAccount(_ account: Account) {
        if let goals = account.goals?.allObjects as? [Goal] {
            goals.forEach { managedObjectContext.delete($0) }
        }
        if let budgets = account.budgets?.allObjects as? [Budget] {
            budgets.forEach { managedObjectContext.delete($0) }
        }
        if let transactions = account.transactions?.allObjects as? [Transaction] {
            transactions.forEach { managedObjectContext.delete($0) }
        }
        if let categories = account.categories?.allObjects as? [Category] {
            categories.forEach { managedObjectContext.delete($0) }
        }
        managedObjectContext.delete(account)
        saveContext()
    }
}

// MARK: - Transactions
extension CoreDataManager: TransactionsCoreDataManagerProtocol {
    /// Fetches all past transactions
    /// - Returns: Transactions that took place before the current time
    func fetchTransactions() -> [Transaction]? {
        let fetchRequest = Transaction.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date < %@", Date() as CVarArg)
        let sortDescriptor = NSSortDescriptor(key: #keyPath(Transaction.date), ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let transactions = try? managedObjectContext.fetch(fetchRequest)
        return transactions
    }
    
    /// Fetches transactions by provided category
    /// - Parameter category: The category by which transactions will be extracted
    /// - Returns: Transactions by provided category
    func fetchTransactions(by category: Category) -> [Transaction]? {
        let fetchRequest = Transaction.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "category = %@", category)
        let sortDescriptor = NSSortDescriptor(key: #keyPath(Transaction.date), ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let transactions = try? managedObjectContext.fetch(fetchRequest)
        return transactions
    }
    
    /// Fetches all transactions that have a date later than the current one
    /// - Returns: Transactions that will take place after the current time
    func fetchPlannedTransactions() -> [Transaction]? {
        let fetchRequest = Transaction.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date > %@", Date() as CVarArg)
        let sortDescriptor = NSSortDescriptor(key: #keyPath(Transaction.date), ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let transactions = try? managedObjectContext.fetch(fetchRequest)
        return transactions
    }
    
    /// Creates transaction with provided data
    /// - Parameter data: Model with data to create transaction
    func createTransaction(with data: TransactionInfo) {
        let transaction = Transaction(context: managedObjectContext)
        transaction.date = data.date
        transaction.wallet = data.wallet
        transaction.sum = Int64(data.sum)
        transaction.isExpense = data.isExpense
        /// The next two properties are optionals, but one of them must be provided
        transaction.category = data.category
        transaction.goal = data.goal
        transaction.repeats = data.repeats // `none` by default
        transaction.notes = data.notes // optional
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
    
    func createCategory(with data: CategoryInfo) {
        let category = Category(context: managedObjectContext)
        category.wallet = data.wallet
        category.emoji = data.emoji
        category.name = data.name
        saveContext()
    }
    
    func deleteCategory(_ category: Category) {
        if let budget = category.budget {
            managedObjectContext.delete(budget)
        }
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
        let goal = Goal(context: managedObjectContext)
        goal.wallet = data.wallet
        goal.name = data.name
        goal.emoji = data.emoji
        goal.current = data.current
        goal.aim = data.aim
        goal.dateCreated = data.dateCreated
        goal.dateDeadline = data.dateDeadline
        saveContext()
    }
    
    func deleteGoal(_ goal: Goal) {
        if let transactions = goal.transactions?.allObjects as? [Transaction] {
            transactions.forEach { managedObjectContext.delete($0) }
        }
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
        let budget = Budget(context: managedObjectContext)
        budget.wallet = data.wallet
        budget.date = Date()
        budget.sum = data.sum
        budget.category = data.category
        budget.period = data.period
        saveContext()
    }
    
    func deleteBudget(_ budget: Budget) {
        managedObjectContext.delete(budget)
        saveContext()
    }
}
