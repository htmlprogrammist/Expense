//
//  TransactionDetailsPresenter.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//

protocol TransactionDetailsPresenterProtocol: AnyObject {
    var moduleOutput: TransactionDetailsModuleOutputProtocol? { get set }
}

protocol TransactionDetailsModuleOutputProtocol: AnyObject {
}

final class TransactionDetailsPresenter: TransactionDetailsPresenterProtocol {
	weak var view: TransactionDetailsViewProtocol?
    weak var moduleOutput: TransactionDetailsModuleOutputProtocol?
    
	private let router: TransactionDetailsRouterProtocol
    
    init(router: TransactionDetailsRouterProtocol) {
        self.router = router
    }
}
