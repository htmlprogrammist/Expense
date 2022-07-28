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
    func updateAccount(with data: AccountInfo)
    func deleteAccount(_ wallet: Account)
}

protocol TransactionsCoreDataManagerProtocol {
    func fetchTransactions() -> [Transaction]?
//    func fetchTransactions(by category: Category) -> [Transaction]? // remove its' implementation
//    func fetchTransactions(by goal: Goal) -> [Transaction]?
    func fetchPlannedTransactions(limit: Bool) -> [Transaction]?
    
    func createTransaction(with data: TransactionInfo, in account: Account)
    func updateTransaction(with data: TransactionInfo)
    func deleteTransaction(_ transaction: Transaction)
}

protocol CategoriesCoreDataManagerProtocol {
    func fetchCategories() -> [Category]?
    func createCategory(with data: CategoryInfo)
    func updateCategory(with data: CategoryInfo)
    func deleteCategory(_ category: Category)
}

protocol GoalsCoreDataManagerProtocol {
    func fetchGoals(limit: Bool) -> [Goal]?
    func createGoal(with data: GoalInfo)
    func updateGoal(with data: GoalInfo)
    func deleteGoal(_ goal: Goal)
}

protocol BudgetsCoreDataManagerProtocol {
    func fetchBudgets(limit: Bool) -> [Budget]?
    func createBudget(with data: BudgetInfo)
    func updateBudget(with data: BudgetInfo)
    func deleteBudget(_ budget: Budget)
}

final class CoreDataManager {
    
    private let managedObjectContext: NSManagedObjectContext
    private let persistentContainer: NSPersistentContainer
    
    private enum Constants {
        /// This fetch limit is needed onto the main (Home) screen, where the maximum of shown objects equals  `3`
        static let fetchLimit = 3
    }
    
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
        try? managedObjectContext.fetch(Account.fetchRequest())
    }
    
    func createAccount(with data: AccountInfo) {
        let account = Account(context: managedObjectContext)
        account.id = UUID()
        account.emoji = data.emoji.rawValue
        account.name = data.name
        account.balance = data.balance
        account.date = Date()
        saveContext()
    }
    
    func updateAccount(with data: AccountInfo) {
        
    }
    
    func deleteAccount(_ account: Account) {
        if let goals = account.goals?.array as? [Goal] {
            goals.forEach { managedObjectContext.delete($0) }
        }
        if let budgets = account.budgets?.array as? [Budget] {
            budgets.forEach { managedObjectContext.delete($0) }
        }
        if let transactions = account.transactions?.allObjects as? [Transaction] {
            transactions.forEach { managedObjectContext.delete($0) }
        }
        if let categories = account.categories?.array as? [Category] {
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
    func fetchPlannedTransactions(limit: Bool) -> [Transaction]? {
        let fetchRequest = Transaction.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date > %@", Date() as CVarArg)
        let sortDescriptor = NSSortDescriptor(key: #keyPath(Transaction.date), ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        if limit {
            fetchRequest.fetchLimit = Constants.fetchLimit
        }
        let transactions = try? managedObjectContext.fetch(fetchRequest)
        return transactions
    }
    
    /// Creates transaction with provided data
    /// - Parameter data: Model with data to create transaction
    func createTransaction(with data: TransactionInfo, in account: Account) {
        let transaction = Transaction(context: managedObjectContext)
        transaction.date = data.date
        transaction.sum = data.sum
        transaction.isIncome = data.isIncome
        transaction.repeats = data.repeats // `none` by default
        transaction.notes = data.notes // optional
        /// The next two properties are optionals, but one of them must be provided
        transaction.category = data.category
        transaction.goal = data.goal
        account.addToTransactions(transaction)
        saveContext()
    }
    
    func updateTransaction(with data: TransactionInfo) {
        
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
        category.account = data.account
        category.emoji = data.emoji.rawValue
        category.name = data.name
        saveContext()
    }
    
    func updateCategory(with data: CategoryInfo) {
        
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
    func fetchGoals(limit: Bool) -> [Goal]? {
        let fetchRequest = Goal.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: #keyPath(Goal.dateDeadline), ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        if limit {
            fetchRequest.fetchLimit = Constants.fetchLimit
        }
        let goals = try? managedObjectContext.fetch(fetchRequest)
        return goals
    }
    
    func createGoal(with data: GoalInfo) {
        let goal = Goal(context: managedObjectContext)
        goal.account = data.account
        goal.name = data.name
        goal.emoji = data.emoji
        goal.current = data.current
        goal.aim = data.aim
        goal.dateCreated = data.dateCreated
        goal.dateDeadline = data.dateDeadline
        saveContext()
    }
    
    func updateGoal(with data: GoalInfo) {
        
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
    func fetchBudgets(limit: Bool) -> [Budget]? {
        let fetchRequest = Budget.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: #keyPath(Budget.date), ascending: false) // TODO: мб сортировать по соотношению тек.сумма/итоговая?
        fetchRequest.sortDescriptors = [sortDescriptor]
        if limit {
            fetchRequest.fetchLimit = Constants.fetchLimit
        }
        let budgets = try? managedObjectContext.fetch(fetchRequest)
        return budgets
    }
    
    func createBudget(with data: BudgetInfo) {
        let budget = Budget(context: managedObjectContext)
        budget.account = data.account
        budget.date = Date()
        budget.sum = data.sum
        budget.category = data.category
        budget.period = data.period
        saveContext()
    }
    
    func updateBudget(with data: BudgetInfo) {
        
    }
    
    func deleteBudget(_ budget: Budget) {
        managedObjectContext.delete(budget)
        saveContext()
    }
}
