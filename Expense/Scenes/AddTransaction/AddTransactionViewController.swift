//
//  AddTransactionViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 11.07.2022.
//

import UIKit

final class AddTransactionViewController: UIViewController {
    
    private let segmentedControl = UISegmentedControl(action: #selector(segmentedControlDidChange))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeThisModule))
        view.backgroundColor = .systemBackground
        title = Texts.Home.addTransaction
    }
    
    @objc
    private func closeThisModule() {
        dismiss(animated: true)
    }
    
    @objc
    private func segmentedControlDidChange() {
        
    }
}
