//
//  AddTransactionPresenter.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  

protocol AddTransactionPresenterProtocol: AnyObject {
}

protocol AddTransactionModuleOutputProtocol: AnyObject {
}

final class AddTransactionPresenter {
	weak var view: AddTransactionViewProtocol?
    weak var moduleOutput: AddTransactionModuleOutputProtocol?
    
	private let router: AddTransactionRouterProtocol
    
    init(router: AddTransactionRouterProtocol) {
        self.router = router
    }
}

extension AddTransactionPresenter: AddTransactionPresenterProtocol {
}
