//
//  HeaderSection.swift
//  Expense
//
//  Created by Егор Бадмаев on 12.07.2022.
//

import UIKit

struct HeaderSection: Section {
    let numberOfItems = 1
    
    private let title: String
    private var subtitle: String = ""
    private var tag: Int = 0
    
    init(title: String) {
        self.title = title
    }
    
    init(title: String, subtitle: String, tag: Int) {
        self.title = title
        self.subtitle = subtitle
        self.tag = tag
    }
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(56))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderCollectionViewCell.identifier, for: indexPath) as? HeaderCollectionViewCell
        else {
            fatalError("Could not create HeaderCollectionViewCell at indexPath \(indexPath)")
        }
        cell.configure(title: title, subtitle: subtitle, tag: tag)
        return cell
    }
}
