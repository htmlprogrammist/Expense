//
//  HomeViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 19.06.2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var sections: [Section] = [
        AccountSection(numberOfItems: 3),
        PageControlSection(numberOfPages: 3),
        HeaderSection(title: Texts.Home.goals, subtitle: Texts.Home.goalsDescription, tag: 1),
        ProgressSection(numberOfItems: 3, isGoals: true),
        HeaderSection(title: Texts.Home.budgets, subtitle: Texts.Home.budgetsDescription, tag: 2),
        ProgressSection(numberOfItems: 3),
        HeaderSection(title: Texts.Home.more),
        MoreSection(numberOfItems: 4)
    ]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return self.sections[sectionIndex].layoutSection()
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
        collectionView.backgroundColor = .clear
        collectionView.register(HeaderCollectionViewCell.self, forCellWithReuseIdentifier: HeaderCollectionViewCell.identifier)
        collectionView.register(PageControlCollectionViewCell.self, forCellWithReuseIdentifier: PageControlCollectionViewCell.identifier)
        collectionView.register(AccountCollectionViewCell.self, forCellWithReuseIdentifier: AccountCollectionViewCell.identifier)
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: ProgressCollectionViewCell.identifier)
        collectionView.register(MoreCollectionViewCell.self, forCellWithReuseIdentifier: MoreCollectionViewCell.identifier)
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
    
    @objc private func openSettingsModule() {
        
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
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
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
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
    }
}
