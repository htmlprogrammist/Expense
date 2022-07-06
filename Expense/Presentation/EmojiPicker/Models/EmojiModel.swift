//
//  EmojiModel.swift
//  EmojiPicker
//
//  Created by Иван Изюмкин on 02.06.2022.
//

/// Describes types of emoji categories
public enum EmojiCategoryType: Int {
    case people
    case nature
    case foodAndDrink
    case activity
    case travelAndPlaces
    case objects
    case symbols
    case flags
}

/// Describes emoji categories
public struct EmojiCategory {
    var categoryName: String
    var emojis: [[Int]]
}
