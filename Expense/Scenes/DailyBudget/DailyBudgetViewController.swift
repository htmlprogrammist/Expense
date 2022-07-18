//
//  DailyBudgetViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 11.07.2022.
//

import UIKit

protocol DailyBudgetViewProtocol: AnyObject {
}

final class DailyBudgetViewController: UIViewController {
    
    private let presenter: DailyBudgetPresenterProtocol
    
    init(presenter: DailyBudgetPresenterProtocol) {
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

extension DailyBudgetViewController: DailyBudgetViewProtocol {
}
