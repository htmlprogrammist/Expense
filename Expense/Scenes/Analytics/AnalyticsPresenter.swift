//
//  AnalyticsPresenter.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  

import Foundation

protocol AnalyticsPresenterProtocol: AnyObject {
}

protocol AnalyticsModuleOutputProtocol: AnyObject {
}

final class AnalyticsPresenter: AnalyticsPresenterProtocol {
	weak var view: AnalyticsViewProtocol?
    weak var moduleOutput: AnalyticsModuleOutputProtocol?
    
	private let router: AnalyticsRouterProtocol
    
    init(router: AnalyticsRouterProtocol) {
        self.router = router
    }
}
