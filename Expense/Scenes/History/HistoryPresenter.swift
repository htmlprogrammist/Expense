//
//  HistoryPresenter.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  
//

import Foundation

protocol HistoryPresenterProtocol: AnyObject {
}

protocol HistoryModuleOutputProtocol: AnyObject {
}

final class HistoryPresenter {
	weak var view: HistoryViewProtocol?
    weak var moduleOutput: HistoryModuleOutputProtocol?
    
	private let router: HistoryRouterProtocol
    
    init(router: HistoryRouterProtocol) {
        self.router = router
    }
}

extension HistoryPresenter: HistoryPresenterProtocol {
}
