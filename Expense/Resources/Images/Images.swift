//
//  Images.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import UIKit

enum Images {
    static let info = Image("info.circle.fill")
    static let categoryMock = Image("bag.fill").withTintColor(.systemGray3) // потом подобрать цвет!
    
    // Tab bar items
    enum TabBarItems {
        static let home = Image("creditcard.fill")
        static let history = Image("clock.fill")
        static let analytics = Image("chart.bar.fill")
        static let settings = Image("gear").withConfiguration(UIImage.SymbolConfiguration(weight: .medium))
    }
    
    enum Home {
        static let add = Image("plus").withConfiguration(UIImage.SymbolConfiguration(weight: .semibold))
        static let calendar = Image("calendar")
        static let dailyBudget = Image("banknote")
        static let goals = Image("mappin")
        static let budgets = Image("chart.pie.fill")
    }
    
    enum History {
        static let filter = Image("line.3.horizontal.decrease.circle")
        static let filterHighlighted = Image("line.3.horizontal.decrease.circle.fill")
        static let export = Image("square.and.arrow.up")
        static let forward = Image("chevron.forward.circle.fill")
        static let backward = Image("chevron.backward.circle.fill")
    }
    
    enum Analytics {
        
    }
    
    enum Settings {
        
    }
}

extension Images {
    static func Image(_ name: String, renderingMode: UIImage.RenderingMode = .alwaysTemplate) -> UIImage {
        return UIImage(named: name)!.withRenderingMode(renderingMode)
    }
}

