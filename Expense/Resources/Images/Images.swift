//
//  Images.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import UIKit

enum Images {
    static let info = Image("info.circle.fill")
    
    // Tab bar items
    static let home = Image("creditcard.fill")
    static let history = Image("clock.fill")
    static let analytics = Image("chart.bar.fill")
    
    // Home
    static let settings = Image("gear")
    static let add = Image("plus.circle.fill")
    static let calendar = Image("calendar.circle.fill")
    
    // History & Analytics
    static let filter = Image("line.3.horizontal.decrease.circle")
    static let forward = Image("chevron.forward.circle.fill")
    static let backward = Image("chevron.backward.circle.fill")
}

extension Images {
    static func Image(_ name: String, renderingMode: UIImage.RenderingMode = .alwaysTemplate) -> UIImage {
        return UIImage(named: name)!.withRenderingMode(renderingMode)
    }
}

