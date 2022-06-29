//
//  CategoryInfo.swift
//  Expense
//
//  Created by Егор Бадмаев on 28.06.2022.
//

struct CategoryInfo {
    let wallet: Wallet
    let name: String
    let emoji: String
}

extension Category {
    var categoryInfo: CategoryInfo {
        CategoryInfo(wallet: wallet, name: name, emoji: emoji)
    }
}
