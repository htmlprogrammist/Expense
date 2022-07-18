//
//  TransactionDetailsViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  

import UIKit

protocol TransactionDetailsViewProtocol: AnyObject {
}

final class TransactionDetailsViewController: UIViewController {
    
    private let presenter: TransactionDetailsPresenterProtocol
    
    init(presenter: TransactionDetailsPresenterProtocol) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

extension TransactionDetailsViewController: TransactionDetailsViewProtocol {
}
