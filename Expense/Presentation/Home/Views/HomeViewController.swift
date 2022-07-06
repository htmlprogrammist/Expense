//
//  HomeViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 19.06.2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let tableViewData: [(image: UIImage, title: String, color: UIColor)] = [
        (Images.Home.calendar, Texts.Home.scheduledOperations, .systemRed),
        (Images.Home.dailyBudget, Texts.Home.dailyBudget, .systemGreen),
        (Images.Home.goals, Texts.Home.goals, .systemBlue),
        (Images.Home.budgets, Texts.Home.budgets, .systemIndigo)
    ]
    
    // MARK: - Views
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.backgroundColor = .gray
        scrollView.autoresizingMask = .flexibleHeight
        scrollView.bounces = true
//        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear
        collectionView.register(SmallCollectionViewCell.self, forCellWithReuseIdentifier: SmallCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var moreTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 46
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.sectionHeaderHeight = 46
        tableView.register(TitleTableViewHeader.self, forHeaderFooterViewReuseIdentifier: TitleTableViewHeader.identifier)
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var addTransactionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = UIColor(named: "AccentColor")
        button.setImage(Images.Home.add, for: .normal)
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(addTransaction), for: .touchUpInside)
        // Shadows
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 10.0
        button.layer.masksToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    @objc func addTransaction(sender: UIButton) {
        /// **Button's animation**, it shrinks a bit and then becomes `identity`
        sender.transform = CGAffineTransform(scaleX: 0.975, y: 0.975)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: UIView.AnimationOptions.allowUserInteraction, animations: {
            sender.transform = CGAffineTransform.identity
        })
        
        
    }
    
    @objc func openSettingsModule() {
        let settings = UINavigationController(rootViewController: SettingsViewController())
        settings.modalPresentationStyle = .fullScreen
        present(settings, animated: true)
    }
    
    func setupView() {
        view.backgroundColor = .systemGroupedBackground
        title = Texts.Home.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Images.Home.settings, style: .plain, target: self, action: #selector(openSettingsModule))
        
        view.addSubview(scrollView)
        scrollView.addSubview(mainCollectionView)
        scrollView.addSubview(moreTableView)
        view.addSubview(addTransactionButton)
        
        // Setting constraints for view
        NSLayoutConstraint.activate([
//            mainCollectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
//            mainCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            mainCollectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
//            mainCollectionView.bottomAnchor.constraint(equalTo: moreTableView.topAnchor),
//
//            moreTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
////            mainCollectionView.topAnchor.constraint(equalTo: mainCollectionView.bottomAnchor), // ?
//            moreTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            moreTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            addTransactionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            addTransactionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            addTransactionButton.heightAnchor.constraint(equalToConstant: 60),
            addTransactionButton.widthAnchor.constraint(equalToConstant: 60),
        ])
        
        // Setting constraints for scroll view
        NSLayoutConstraint.activate([
            mainCollectionView.leadingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leadingAnchor),
            mainCollectionView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainCollectionView.trailingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.trailingAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: moreTableView.topAnchor),
            
            moreTableView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
//            moreTableView.topAnchor.constraint(equalTo: mainCollectionView.bottomAnchor), // ?
            moreTableView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            moreTableView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - CollectionView
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
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
        cell.backgroundColor = .systemIndigo
        return cell
    }
}

// MARK: - TableView
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var numberOfRows = 1
        var numberOfRows = 4
        numberOfRows += (Settings.shared.showGoals ?? false) ? 1 : 0
        numberOfRows += (Settings.shared.showBudgets ?? false) ? 1 : 0
        numberOfRows += (Settings.shared.showDailyBudget ?? false) ? 1 : 0
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TitleTableViewHeader.identifier) as? TitleTableViewHeader
        else {
            fatalError("Could not create header for moreTableView")
        }
        header.configure(with: Texts.Home.more)
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
