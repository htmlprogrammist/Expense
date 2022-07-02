//
//  HomeViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 19.06.2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let addTransactionButton = UIButton(title: "Add", image: Images.add, backgroundColor: UIColor(named: "AccentColor") ?? .white, cornerRadius: 22, shadows: true)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
}

// MARK: - Helper methods
private extension HomeViewController {
    func setupView() {
        view.backgroundColor = .systemGroupedBackground
        title = Texts.Home.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Images.settings, style: .plain, target: self, action: nil)
        
        view.addSubview(tableView)
        view.addSubview(addTransactionButton)
        addTransactionButton.addTarget(self, action: #selector(addTransaction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            
            addTransactionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 36),
            addTransactionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -36),
            addTransactionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            addTransactionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
        
    @objc func addTransaction(sender: UIButton) {
        
        
        /// **Button's animation**, it shrinks a bit and then becomes `identity`
        sender.transform = CGAffineTransform(scaleX: 0.975, y: 0.975)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: UIView.AnimationOptions.allowUserInteraction, animations: {
            sender.transform = CGAffineTransform.identity
        })
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
}
