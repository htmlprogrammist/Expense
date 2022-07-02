//
//  HomeViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 19.06.2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let addTransactionButton = UIButton(title: "Add", backgroundColor: UIColor(named: "AccentColor") ?? .white, shadows: true)
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "ПРОФИЛЬ: БУХГАЛТЕР"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .secondaryLabel
        label.layer.zPosition = 999
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let settingsIcon: UIButton = {
        let button = UIButton()
        button.setImage(Images.settings, for: .normal)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 18
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(presentUserTableViewController), for: .touchUpInside)
        return button
    }()
    
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
        addIconButtonOnNavigationBar()
    }
}

// MARK: - Helper methods
private extension HomeViewController {
    func setupView() {
        view.backgroundColor = .systemGroupedBackground
        title = Texts.Home.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Images.settings, style: .plain, target: self, action: nil)
        
//        view.addSubview(addTransactionButton)
//        addTransactionButton.addTarget(self, action: #selector(addTransaction), for: .touchUpInside)
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            
//            addTransactionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 36),
//            addTransactionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -36),
//            addTransactionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
//            addTransactionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func addIconButtonOnNavigationBar() {
        guard let navController = navigationController else { return }
        guard let classType = NSClassFromString("_UINavigationBarLargeTitleView") else { return }
        
        for subView in navController.navigationBar.subviews {
            if subView.isKind(of: classType) {
                subView.layer.zPosition = 100
                subView.addSubview(subtitleLabel)
                subView.addSubview(settingsIcon)
                
                guard let largeTitleLabel = subView.subviews.first as? UILabel else { return }
                
                NSLayoutConstraint.activate([
                    subtitleLabel.leadingAnchor.constraint(equalTo: subView.layoutMarginsGuide.leadingAnchor),
                    subtitleLabel.topAnchor.constraint(equalTo: subView.topAnchor, constant: -6),
                    
                    settingsIcon.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: -25),
//                    settingsIcon.centerYAnchor.constraint(equalTo: largeTitleLabel.centerYAnchor, constant: -5),
//                    settingsIcon.centerYAnchor.constraint(equalTo: subView.centerYAnchor),
                    settingsIcon.topAnchor.constraint(equalTo: subView.topAnchor, constant: 6),
                    settingsIcon.widthAnchor.constraint(equalToConstant: 36),
                    settingsIcon.heightAnchor.constraint(equalToConstant: 36)
                ])
            }
        }
    }
        
    @objc func addTransaction(sender: UIButton) {
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
