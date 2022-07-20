//
//  HistoryPresenter.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//

import Foundation

protocol HistoryPresenterProtocol: AnyObject {
    func provideData(by period: Period)
}

protocol HistoryModuleOutputProtocol: AnyObject {
}

final class HistoryPresenter: HistoryPresenterProtocol {
    weak var view: HistoryViewProtocol?
    weak var moduleOutput: HistoryModuleOutputProtocol?
    
    private let router: HistoryRouterProtocol
    
    init(router: HistoryRouterProtocol) {
        self.router = router
    }
    
    func provideData(by period: Period) {
        switch period {
        case .day:
            break
        case .week:
            break
        case .month:
            break
        case .year:
            break
        default:
            break
        }
    }
}

// MARK: - Helper methods
private extension HistoryPresenter {
    // Можно, кстати, сделать так, чтобы она выдавала в массив уже `Tagged (StringDate)`, потому что используется всё равно только в хедере, которому нужно скормить `StringDate`
    func getWeeks() {
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: Date())
        // дата первой транзакции
        let lastDayOfTheYear = calendar.date(from: DateComponents(year: currentYear, month: 12, day: 31))
        // дата последней транзакции
        var currentDate = calendar.date(from: DateComponents(year: currentYear, month: 1, day: 1))
        
        while currentDate! < lastDayOfTheYear! {
            let startDay = currentDate!.startOfWeek!
            let endDay = currentDate!.endOfWeek!
            
            let formatter = DateIntervalFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            
            let outputString = formatter.string(from: startDay, to: endDay)
            print(outputString) // object: (outputString: String, startDay: Date, endDay: Date)
            currentDate = calendar.date(byAdding: .weekOfYear, value: 1, to: currentDate!)
        }
    }
}
