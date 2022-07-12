//
//  CategoryInfo.swift
//  Expense
//
//  Created by Егор Бадмаев on 28.06.2022.
//

/**
 An empty enum solves 2 problems:
 
 1. You cannot create any instance of it;
 2. At the compilation stage, it is impossible to put one type instead of another.
 It helps when `RawValue` type of one structure equals another, the compiler will see, that they are not equal by `Tag` type and the project will not build.
 */
enum EmojiTag {}
typealias Emoji = Tagged<EmojiTag, String>

struct CategoryInfo {
    let account: Account
    let name: String
    let emoji: Emoji
}
