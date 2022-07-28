//
//  CreateAccountViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 17.07.2022.
//  

import UIKit

protocol CreateAccountViewProtocol: AnyObject {
}

final class CreateAccountViewController: UIViewController {
    // MARK: - Private properties
    private let presenter: CreateAccountPresenterProtocol
    
    // MARK: - Init
    init(presenter: CreateAccountPresenterProtocol) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

extension CreateAccountViewController: CreateAccountViewProtocol {
}
