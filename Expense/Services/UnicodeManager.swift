//
//  UnicodeManager.swift
//  EmojiPicker
//
//  Created by Иван Изюмкин on 07.06.2022.
//

import UIKit

/// The protocol is necessary to hide unnecessary methods with Unicode categories in UnicodeManager
protocol UnicodeManagerProtocol {
    /// Returns relevant emojis for the current iOS version
    func getEmojisForCurrentIOSVersion() -> [EmojiCategory]
}

/// The class is responsible for getting a relevant set of emojis for iOS version
final class UnicodeManager: UnicodeManagerProtocol {
    
    private var currentVersion: Float {
        return (UIDevice.current.systemVersion as NSString).floatValue
    }
    
    /// Gets version of iOS for current device
    /// - Returns: Array of emoji categories (and array of emojis inside them)
    public func getEmojisForCurrentIOSVersion() -> [EmojiCategory] {
        switch currentVersion {
        case 12.1...13.1:
            return unicode11
        case 13.2...14.1:
            return unicode12
        case 14.2...14.4:
            return unicode13
        case 14.5...15.3:
            return unicode13v1
        case 15.4...:
            return unicode14
        default:
            return unicode5
        }
    }
    
    /// Returns a localized name for the emoji category.
    /// - Parameter type: Emoji category type
    /// - Returns: Name of the category
    public func getEmojiCategoryTitle(for type: EmojiCategoryType) -> String {
        switch type {
        case .people:
            return Texts.EmojiPicker.emotionsAndPeople
        case .nature:
            return Texts.EmojiPicker.animalsAndNature
        case .foodAndDrink:
            return Texts.EmojiPicker.foodAndDrinks
        case .activity:
            return Texts.EmojiPicker.activities
        case .travelAndPlaces:
            return Texts.EmojiPicker.travellingAndPlaces
        case .objects:
            return Texts.EmojiPicker.objects
        case .symbols:
            return Texts.EmojiPicker.symbols
        case .flags:
            return Texts.EmojiPicker.flags
        }
    }
}
