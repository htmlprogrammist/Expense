//
//  PageControlSection.swift
//  Expense
//
//  Created by Егор Бадмаев on 12.07.2022.
//

import UIKit

struct PageControlSection: Section {
    let numberOfItems = 1
    
    private let numberOfPages: Int
    
    init(numberOfPages: Int) {
        self.numberOfPages = numberOfPages
    }
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(28))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .absolute(28))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageControlCollectionViewCell.identifier, for: indexPath) as? PageControlCollectionViewCell
        else {
            fatalError("Could not create PageControlCollectionViewCell at indexPath \(indexPath)")
        }
        cell.configure(numberOfPages: numberOfPages)
        return cell
    }
}
