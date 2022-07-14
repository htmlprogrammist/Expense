//
//  ProgressSection.swift
//  Expense
//
//  Created by Егор Бадмаев on 12.07.2022.
//

import UIKit

struct ProgressSection: Section {
    public let numberOfItems: Int
    public var isGoals: Bool = false
    
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(92))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .absolute(90))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        if isGoals {
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
        }
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(54))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgressCollectionViewCell.identifier, for: indexPath) as? ProgressCollectionViewCell
        else {
            fatalError("Could not create ProgressCollectionViewCell at indexPath \(indexPath)")
        }
        struct ProgressCellModel: ProgressCellModelProtocol {
            let emoji: Emoji
            let title: String
            let firstSubtitle: String
            let secondSubtitle: String
            let progress: Double
        }
        let data = ProgressCellModel(emoji: Tagged("🎡"), title: "Развлечения", firstSubtitle: "Бюджет: \(Int.random(in: 1000...10000)) ₽", secondSubtitle: "Потрачено: \(Int.random(in: 1000...10000)) ₽", progress: Double.random(in: 0...1))
        cell.configure(data: data)
        return cell
    }
}
