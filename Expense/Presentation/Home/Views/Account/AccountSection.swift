//
//  AccountSection.swift
//  Expense
//
//  Created by Егор Бадмаев on 12.07.2022.
//

import UIKit

final class AccountSection: Section {
    public let numberOfItems: Int
    
    private var lastItem = 0
    
    init(numberOfItems: Int) {
        self.numberOfItems = numberOfItems
    }
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(112))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .absolute(112))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(28))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        section.boundarySupplementaryItems = [footer]
        section.visibleItemsInvalidationHandler = { [weak self] (items, offset, environment) -> Void in
            guard let strongSelf = self else { return }
            let page = Int(abs(round(offset.x / environment.container.contentSize.width)))
            if page != strongSelf.lastItem { // on value changed
                strongSelf.lastItem = page
                // TODO: 1. update your paging indicator `pageControl.currentPage = page`; 2. load data by chosen account
            }
        }
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountCollectionViewCell.identifier, for: indexPath) as? AccountCollectionViewCell
        else {
            fatalError("Could not create AccountCollectionViewCell at indexPath \(indexPath)")
        }
        return cell
    }
}
