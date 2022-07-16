//
//  Section.swift
//  Expense
//
//  Created by Егор Бадмаев on 12.07.2022.
//

import UIKit

protocol Section {
    var numberOfItems: Int { get }
//    var data: [NSManagedObject] { get }
    func layoutSection() -> NSCollectionLayoutSection
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}
