//
//  CreateAccountPresenter.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  

protocol CreateAccountPresenterProtocol: AnyObject {
    var moduleOutput: CreateAccountModuleOutputProtocol? { get set }
}

protocol CreateAccountModuleOutputProtocol: AnyObject {
}

final class CreateAccountPresenter: CreateAccountPresenterProtocol {
    // MARK: - Public properties
	weak var view: CreateAccountViewProtocol?
    weak var moduleOutput: CreateAccountModuleOutputProtocol?
    
    // MARK: - Private properties
	private let router: CreateAccountRouterProtocol
    
    // MARK: - Init
    init(router: CreateAccountRouterProtocol) {
        self.router = router
    }
}
