//
//  MoreSection.swift
//  Expense
//
//  Created by Егор Бадмаев on 12.07.2022.
//

import UIKit

final class MoreSection: Section {
    
    public var numberOfItems: Int {
        dataItems.count
    }
    
    private let dataItems: [(image: UIImage, title: String, color: UIColor)?] = {
        let optionalDataItems: [(UIImage, String, UIColor)?] = [
            (Images.Home.calendar, Texts.Home.plannedOperations, .systemRed),
            (Images.Home.dailyBudget, Texts.Home.dailyBudget, .systemGreen),
            (UserDefaults.showGoals) ? nil : (Images.Home.goals, Texts.Home.goals, .systemBlue),
            (UserDefaults.showBudgets) ? nil : (Images.Home.budgets, Texts.Home.budgets, .systemIndigo)
        ]
        return optionalDataItems.filter { $0 != nil }
    }()
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(54))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 6, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .absolute(CGFloat(54 * numberOfItems)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: numberOfItems)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(56))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreCollectionViewCell.identifier, for: indexPath) as? MoreCollectionViewCell
        else {
            fatalError("Could not create MoreCollectionViewCell at indexPath \(indexPath)")
        }
        let item = dataItems[indexPath.row]
        cell.configure(image: item?.image, title: item?.title, color: item?.color)
        return cell
    }
}
