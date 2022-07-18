//
//  CreateAccountPresenter.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  

protocol CreateAccountPresenterProtocol: AnyObject {
}

protocol CreateAccountModuleOutputProtocol: AnyObject {
}

final class CreateAccountPresenter: CreateAccountPresenterProtocol {
	weak var view: CreateAccountViewProtocol?
    weak var moduleOutput: CreateAccountModuleOutputProtocol?
    
	private let router: CreateAccountRouterProtocol
    
    init(router: CreateAccountRouterProtocol) {
        self.router = router
    }
}
