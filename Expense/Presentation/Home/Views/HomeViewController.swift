//
//  HomeViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 19.06.2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    let settings = Settings()
    
    private let tableViewData: [(image: UIImage, title: String, color: UIColor)] = [
        (Images.calendar, Texts.Home.scheduledOperations, .systemRed),
        (Images.dailyBudget, Texts.Home.dailyBudget, .systemGreen),
        (Images.goals, Texts.Home.goals, .systemBlue),
        (Images.budgets, Texts.Home.budgets, .systemIndigo)
    ]
    
    private lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SmallCollectionViewCell.self, forCellWithReuseIdentifier: SmallCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var moreTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 48
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let addTransactionButton = UIButton(title: "Add", image: Images.add, backgroundColor: UIColor(named: "AccentColor") ?? .white, cornerRadius: 22, shadows: true)
    
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
        
        view.addSubview(mainCollectionView)
        view.addSubview(moreTableView)
        view.addSubview(addTransactionButton)
        addTransactionButton.addTarget(self, action: #selector(addTransaction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            mainCollectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            mainCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainCollectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: moreTableView.topAnchor),
            
            moreTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            mainCollectionView.topAnchor.constraint(equalTo: mainCollectionView.bottomAnchor), // ?
            moreTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            moreTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
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

// MARK: - CollectionView
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: // general
            return 3 // (2 + 1 (charts))
        case 1: // goals
            return Int.random(in: 1...3)
        case 2: // budgets
            return Int.random(in: 1...3)
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallCollectionViewCell.identifier, for: indexPath) as? SmallCollectionViewCell
        else {
            fatalError("Could not create CollectionViewCell at cellForItemAt method in Home")
        }
        return cell
    }
}

// MARK: - TableView
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var numberOfRows = 1
        var numberOfRows = 4
        numberOfRows += (settings.showGoals ?? false) ? 1 : 0
        numberOfRows += (settings.showBudgets ?? false) ? 1 : 0
        numberOfRows += (settings.dailyBudget ?? false) ? 1 : 0
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell
        else {
            fatalError("Could not create TableViewCell at cellForRow at method in Home")
        }
        // TODO: По настройкам отображать соответствующие данные
        let item = tableViewData[indexPath.row]
        cell.configure(image: item.image, title: item.title, color: item.color)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
