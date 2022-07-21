//
//  InfoSection.swift
//  Expense
//
//  Created by Егор Бадмаев on 12.07.2022.
//

import UIKit

struct InfoSection: Section {
    
    public let numberOfItems: Int = 1
    public var dailyBudget: Double = 0.0
    
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
        switch indexPath {
        case [1, 0]:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MonthInfoCollectionViewCell.identifier, for: indexPath) as? MonthInfoCollectionViewCell
            else {
                fatalError("Could not create MonthInfoCollectionViewCell at indexPath \(indexPath)")
            }
            return cell
        case [2, 0]:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyBudgetCollectionViewCell.identifier, for: indexPath) as? DailyBudgetCollectionViewCell
            else {
                fatalError("Could not create DailyBudgetCollectionViewCell at indexPath \(indexPath)")
            }
            cell.configure(dailyBudget: dailyBudget)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
