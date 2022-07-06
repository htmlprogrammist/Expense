//
//  AnalyticsViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import UIKit

final class AnalyticsViewController: UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Private methods
    @objc private func chooseFilter() {
        
    }
    
    private func setupView() {
        view.backgroundColor = .systemGroupedBackground
        title = Texts.Analytics.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Images.History.filter, style: .plain, target: self, action: #selector(chooseFilter))
    }
    
}
