//
//  AnalyticsViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import UIKit

protocol AnalyticsViewProtocol: AnyObject {
}

final class AnalyticsViewController: UIViewController {
    
    private let presenter: AnalyticsPresenterProtocol
    
    private let segmentedControl = UISegmentedControl(action: #selector(segmentedControlDidChange))
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = CGSize(width: view.frame.size.width, height: 200)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    init(presenter: AnalyticsPresenterProtocol) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Private methods
    @objc
    private func chooseFilter() {
        
    }
    
    @objc
    private func segmentedControlDidChange() {
        
    }
    
    private func setupView() {
        view.backgroundColor = .systemGroupedBackground
        title = Texts.Analytics.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Images.History.filter, style: .plain, target: self, action: #selector(chooseFilter))
        
        navigationItem.titleView = segmentedControl
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension AnalyticsViewController: AnalyticsViewProtocol {
}

// MARK: - CollectionView
extension AnalyticsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}
