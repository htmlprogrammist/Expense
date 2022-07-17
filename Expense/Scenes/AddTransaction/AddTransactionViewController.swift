//
//  AddTransactionViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 11.07.2022.
//

import UIKit

protocol AddTransactionViewProtocol: AnyObject {
}

final class AddTransactionViewController: UIViewController {
    
    private let presenter: AddTransactionPresenterProtocol
    
    private let segmentedControl = UISegmentedControl(action: #selector(segmentedControlDidChange))
    
    init(presenter: AddTransactionPresenterProtocol) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    @objc private func segmentedControlDidChange() {
        
    }
}

extension AddTransactionViewController: AddTransactionViewProtocol {
}
