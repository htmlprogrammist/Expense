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
    weak var view: CreateAccountViewProtocol?
    weak var moduleOutput: CreateAccountModuleOutputProtocol?
    
    // MARK: - Private properties
    
    private let router: CreateAccountRouterProtocol
    private let useCase: CreateAccountUseCase
    
    // MARK: - Init
    
    init(router: CreateAccountRouterProtocol, useCase: CreateAccountUseCase) {
        self.router = router
        self.useCase = useCase
    }
}
