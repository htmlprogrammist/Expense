//
//  AddTransactionViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 11.07.2022.
//

import UIKit

protocol AddTransactionViewProtocol: AnyObject {
    func configure(with currency: Currency)
}

final class AddTransactionViewController: UIViewController {
    
    private let presenter: AddTransactionPresenterProtocol
    
    private let operatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .tertiaryLabel
        label.text = "-" // by default, in segmentedControl the chosen value is "Expense"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let sumTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .decimalPad
//        textField.font = UIFont.systemFont(ofSize: <#T##CGFloat#>, weight: <#T##UIFont.Weight#>)
        textField.textColor = .tertiaryLabel
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let currencyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .tertiaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
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
        presenter.viewDidLoad()
    }
    
    private func setupView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeThisModule))
        view.backgroundColor = .systemBackground
        title = Texts.Home.addTransaction
        
        view.addSubview(sumTextField)
        view.addSubview(currencyLabel)
        
        
    }
    
    @objc private func saveTransaction() {
        let transaction = TransactionInfo(sum: Double(sumTextField.text ?? "") ?? 0,
                                          isIncome: segmentedControl.selectedSegmentIndex == 0,
                                          notes: nil, category: nil)
        presenter.saveTransaction(with: transaction)
    }
    
    @objc private func closeThisModule() {
        dismiss(animated: true)
    }
    
    @objc private func segmentedControlDidChange(sender: UISegmentedControl) {
        operatorLabel.text = sender.selectedSegmentIndex == 0 ? "+" : "-"
    }
}

extension AddTransactionViewController: AddTransactionViewProtocol {
    func configure(with currency: Currency) {
        sumTextField.placeholder = currency.placeholderSum
        currencyLabel.text = currency.symbol
        // пока что временно так, а по факту они должны быть внутри UIView или типо того
        NSLayoutConstraint.activate(currency.isInFront
                                    ? [
//                                        currencyLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
                                    ]
                                    : []
        )
    }
}
