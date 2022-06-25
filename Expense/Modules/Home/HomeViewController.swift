//
//  HomeViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 19.06.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
}

// MARK: - Helper methods
private extension HomeViewController {
    func setupView() {
        view.backgroundColor = Colors.backgroundColor
        title = Texts.Home.title
    }
}
