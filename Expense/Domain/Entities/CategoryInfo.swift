//
//  CategoryInfo.swift
//  Expense
//
//  Created by Егор Бадмаев on 28.06.2022.
//

/*
 An empty enum solves 2 problems:
 
 1. You cannot create any instance of it;
 2. At the compilation stage, it is impossible to put one type instead of another (it sees that one type is parameterized as one type, and the other as second type, and says that no, this will not work).
 */
enum EmojiTag {} // impossible to create an instance
typealias Emoji = Tagged<EmojiTag, String>

struct CategoryInfo {
    let account: Account
    let name: String
    let emoji: Emoji
}

extension Category {
    var categoryInfo: CategoryInfo {
        CategoryInfo(account: account, name: name, emoji: Tagged(rawValue: emoji))
    }
}
