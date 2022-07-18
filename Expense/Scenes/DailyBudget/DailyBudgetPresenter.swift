//
//  DailyBudgetPresenter.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  

protocol DailyBudgetPresenterProtocol: AnyObject {
}

protocol DailyBudgetModuleOutputProtocol: AnyObject {
}

final class DailyBudgetPresenter: DailyBudgetPresenterProtocol {
	weak var view: DailyBudgetViewProtocol?
    weak var moduleOutput: DailyBudgetModuleOutputProtocol?
    
	private let router: DailyBudgetRouterProtocol
    
    init(router: DailyBudgetRouterProtocol) {
        self.router = router
    }
}
