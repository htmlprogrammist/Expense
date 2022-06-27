//
//  HistoryViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import UIKit

class HistoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}

// MARK: - Helper methods
private extension HistoryViewController {
    func setupView() {
        view.backgroundColor = .systemGroupedBackground
        title = Texts.History.title
    }
}
