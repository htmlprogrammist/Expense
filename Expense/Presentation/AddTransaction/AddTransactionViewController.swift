//
//  AddTransactionViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 11.07.2022.
//

import UIKit

final class AddTransactionViewController: UIViewController {
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: [Texts.Transactions.income, Texts.Transactions.expense])
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.addTarget(self, action: #selector(segmentedControlDidChange), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeThisModule))
        view.backgroundColor = .systemBackground
        title = Texts.Home.addTransaction
    }
    
    @objc private func closeThisModule() {
        dismiss(animated: true)
    }
    
    @objc private func segmentedControlDidChange() {
        
    }
}
