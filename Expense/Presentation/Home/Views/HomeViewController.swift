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
    
    private lazy var sections: [Section] = [
        AccountsSection(numberOfItems: 3),
        ProgressSection(numberOfItems: 3),
        ProgressSection(numberOfItems: 3),
        MoreSection(numberOfItems: 4)
    ]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return self.sections[sectionIndex].layoutSection()
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(AccountCollectionViewCell.self, forCellWithReuseIdentifier: AccountCollectionViewCell.identifier)
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: ProgressCollectionViewCell.identifier)
        collectionView.register(SettingsCollectionViewCell.self, forCellWithReuseIdentifier: SettingsCollectionViewCell.identifier)
        collectionView.register(HomeCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionViewHeader.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    @objc private func openSettingsModule() {
        
    }
    
    private func setupView() {
        view.backgroundColor = .systemGroupedBackground
        title = Texts.Home.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Images.Home.settings, style: .plain, target: self, action: #selector(openSettingsModule))
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - CollectionView
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath) as? AccountCollectionViewCell
//        else {
//            fatalError("Could not create CollectionViewCell at cellForItemAt method in Home module")
//        }
//        return cell
        return sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
    }
}
