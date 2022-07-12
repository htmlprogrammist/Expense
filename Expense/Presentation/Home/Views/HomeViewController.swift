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
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(SmallCollectionViewCell.self, forCellWithReuseIdentifier: SmallCollectionViewCell.identifier)
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: ProgressCollectionViewCell.identifier)
        collectionView.register(SettingsCollectionViewCell.self, forCellWithReuseIdentifier: SettingsCollectionViewCell.identifier)
        collectionView.register(HomeCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionViewHeader.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var addTransactionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .appColor
        button.setImage(Images.Home.add, for: .normal)
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(addTransaction), for: .touchUpInside)
        // Shadows
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.33).cgColor
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
    
    @objc private func addTransaction(sender: UIButton) {
        /// **Button's animation**, it shrinks a bit and then becomes `identity`
        sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        UIView.animate(withDuration: 0.5, delay: 0.01, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: .allowUserInteraction, animations: {
            sender.transform = CGAffineTransform.identity
        })
        
        let addTransactionViewController = UINavigationController(rootViewController: AddTransactionViewController())
        if let sheet = addTransactionViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
//            sheet.prefersGrabberVisible = true
//            sheet.preferredCornerRadius = 12
        }
        present(addTransactionViewController, animated: true)
    }
    
    @objc private func openSettingsModule() {
        
    }
    
    @objc public func handleSeeAll(sender: UIButton) {
        if sender.tag == 1 {
            // TODO: Open all goals module
        } else {
            // TODO: Open all budgets module
        }
    }
    
    private func setupView() {
        view.backgroundColor = .systemGroupedBackground
        title = Texts.Home.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Images.Home.settings, style: .plain, target: self, action: #selector(openSettingsModule))
        
        view.addSubview(collectionView)
        view.addSubview(addTransactionButton)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            addTransactionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            addTransactionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            addTransactionButton.heightAnchor.constraint(equalToConstant: 60),
            addTransactionButton.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
}

// MARK: - CollectionView
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: // general
            return (Settings.shared.showDailyBudget ?? false) ? 2 : 1 // (2 + 1 (charts))
        case 1:
            return 1 // goals.count
        case 2:
            return 1 // budgets.count
        case 3:
            var numberOfRows = 4 // 1
            numberOfRows += (Settings.shared.showGoals ?? true) ? 0 : 1
            numberOfRows += (Settings.shared.showBudgets ?? true) ? 0 : 1
            numberOfRows += (Settings.shared.showDailyBudget ?? true) ? 0 : 1
            return numberOfRows
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallCollectionViewCell.identifier, for: indexPath) as? SmallCollectionViewCell
            else {
                fatalError("Could not create CollectionViewCell at cellForItemAt method in Home module")
            }
            if indexPath.row == 0 {
                cell.configure(title: "10995 ₽", subtitle: Texts.Home.balance)
            } else {
                cell.configure(title: "324 ₽", subtitle: Texts.Home.dailyBudget)
            }
            return cell
        case 1...2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgressCollectionViewCell.identifier, for: indexPath) as? ProgressCollectionViewCell
            else {
                fatalError("Could not create CollectionViewCell at cellForItemAt method in Home module")
            }
            struct ProgressCellModel: ProgressCellModelProtocol {
                let emoji: Emoji
                let title: String
                let firstSubtitle: String
                let secondSubtitle: String
                let progress: Double
            }
            cell.configure(data: ProgressCellModel(emoji: Tagged("🎡"), title: "Развлечения", firstSubtitle: "Бюджет: \(Int.random(in: 1000...10000)) ₽", secondSubtitle: "Потрачено: \(Int.random(in: 1000...10000)) ₽", progress: Double.random(in: 0...1)))
            return cell
        case 3:
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsCollectionViewCell.identifier, for: indexPath) as? SettingsCollectionViewCell
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsCollectionViewCell.identifier, for: indexPath) as? SettingsCollectionViewCell
            else {
                fatalError("Could not create CollectionViewCell at cellForItemAt method in Home module")
            }
            
            let item = tableViewData[indexPath.row]
            cell.configure(image: item.image, title: item.title, color: item.color)
            return cell
        default:
            fatalError("Unexpected section provided in cellForItemAt method in collection view in Home module")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // case [0, 0]: Alert with UITextField that changes user's balance
        // case [0, 1]: Open Daily budget module
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionViewHeader.identifier, for: indexPath) as? HomeCollectionViewHeader
            else {
                fatalError("Could not create CollectionViewHeader at viewForSupplementaryElementOfKind method in Home")
            }
            
            switch indexPath {
            case [1, 0]:
                header.configure(title: Texts.Home.goals, subtitle: Texts.Home.goalsDescription, tag: indexPath.section)
            case [2, 0]:
                header.configure(title: Texts.Home.budgets, subtitle: Texts.Home.budgetsDescription, tag: indexPath.section)
            case [3, 0]:
                header.configure(title: Texts.Home.more)
            default:
                header.configure(title: "", subtitle: "")
            }
            return header
        default:
            fatalError("Unexpected element kind section")
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: (Settings.shared.showDailyBudget ?? false) ? collectionView.frame.size.width * 0.48
                                                                            : collectionView.frame.size.width,
                          height: CGFloat(68))
        case 1...2:
            return CGSize(width: collectionView.frame.size.width * 0.9, height: 90)
        default:
            let width = collectionView.frame.size.width
            let height = CGFloat(48)
            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return .zero
        }
        return CGSize(width: collectionView.frame.size.width, height: 70)
    }
}
