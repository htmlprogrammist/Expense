//
//  HistoryViewModel.swift
//  Expense
//
//  Created by Егор Бадмаев on 01.07.2022.
//

import Foundation

final class HistoryViewModel {
    
}

private extension HistoryViewModel {
    // закинул сюда просто чтобы не потерять
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
