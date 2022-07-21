//
//  OnboardingViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 21.07.2022.
//  
//

import UIKit

protocol OnboardingViewProtocol: AnyObject {
}

final class OnboardingViewController: UIViewController {
    
    private let presenter: OnboardingPresenterProtocol
    
    init(presenter: OnboardingPresenterProtocol) {
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

extension OnboardingViewController: OnboardingViewProtocol {
}
