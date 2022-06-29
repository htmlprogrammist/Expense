//
//  AnalyticsViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import UIKit

final class AnalyticsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
}

// MARK: - Helper methods
private extension AnalyticsViewController {
    func setupView() {
        view.backgroundColor = .systemGroupedBackground
        title = Texts.Analytics.title
    }
}
