//
//  AddTransactionPresenter.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  

import Foundation

protocol AddTransactionPresenterProtocol: AnyObject {
    var moduleOutput: AddTransactionModuleOutputProtocol? { get set }
    
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
//        let expression = NSExpression(format: "3+3") // string from textField.text
//        print(expression.expressionValue(with: nil, context: nil))
//        let expression2 = NSExpression(format: "3*3 / 2")
//        print(expression2.expressionValue(with: nil, context: nil))
//        let expression3 = NSExpression(format: "3*3 / 2")
//        print(expression3.toFloatingPoint().expressionValue(with: nil, context: nil))
//        let expression4 = NSExpression(format: "3")
//        print(expression4.expressionValue(with: nil, context: nil))
//        coreDataManager.createTransaction(with: transaction, in: account)
    }
}
