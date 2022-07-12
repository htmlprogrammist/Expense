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
        collectionView.register(AccountCollectionViewCell.self, forCellWithReuseIdentifier: AccountCollectionViewCell.identifier)
        collectionView.register(SmallCollectionViewCell.self, forCellWithReuseIdentifier: SmallCollectionViewCell.identifier)
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: ProgressCollectionViewCell.identifier)
        collectionView.register(SettingsCollectionViewCell.self, forCellWithReuseIdentifier: SettingsCollectionViewCell.identifier)
        collectionView.register(HomeCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionViewHeader.identifier)
        collectionView.showsVerticalScrollIndicator = false
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
            collectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - CollectionView
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountCollectionViewCell.identifier, for: indexPath) as? AccountCollectionViewCell
        else {
            fatalError("Could not create CollectionViewCell at cellForItemAt method in Home module")
        }
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width * 0.97
        let height = CGFloat(120)
        return CGSize(width: width, height: height)
    }
}
