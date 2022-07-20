//
//  AddTransactionPresenter.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  

protocol AddTransactionPresenterProtocol: AnyObject {
    func viewDidLoad()
    func saveTransaction(with transaction: TransactionInfo)
}

protocol AddTransactionModuleOutputProtocol: AnyObject {
}

final class AddTransactionPresenter: AddTransactionPresenterProtocol {
    
    // MARK: - Public properties
	weak var view: AddTransactionViewProtocol?
    weak var moduleOutput: AddTransactionModuleOutputProtocol?
    public var account: Account!
    
    // MARK: - Private properties
	private let router: AddTransactionRouterProtocol
    private var coreDataManager: TransactionsCoreDataManagerProtocol!
    
    init(router: AddTransactionRouterProtocol) {
        self.router = router
    }
    
    func viewDidLoad() {
        view?.configure(with: account.currency)
    }
    
    func saveTransaction(with transaction: TransactionInfo) {
        // TODO: implement UseCase 
//        coreDataManager.createTransaction(with: transaction, in: account)
    }
}
