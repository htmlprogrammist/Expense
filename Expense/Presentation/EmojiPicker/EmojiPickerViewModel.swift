//
//  EmojiPickerViewModel.swift
//  EmojiPicker
//
//  Created by Иван Изюмкин on 02.06.2022.
//

import Foundation

/// Protocol for the ViewModel which using in EmojiPickerViewController
protocol EmojiPickerViewModelProtocol {
    /// The observed variable that is responsible for the choice of emoji
    var selectedEmoji: Observ<String> { get set }
    /// The observed variable that is responsible for the choice of emoji category
    var selectedEmojiCategoryIndex: Observ<Int> { get set }
    /// The method returns the number of categories with emojis
    func numberOfSections() -> Int
    /// The method returns the number of emojis in the target section
    func numberOfItems(in section: Int) -> Int
    /// This method is responsible for getting the emoji for the target indexPath
    func emoji(at indexPath: IndexPath) -> String
    /// The method is responsible for getting the localized name of the emoji section
    func sectionHeaderViewModel(for section: Int) -> String
}

/// ViewModel which using in EmojiPickerViewController
final class EmojiPickerViewModel: EmojiPickerViewModelProtocol {
    
    public var selectedEmoji = Observ<String>(value: "")
    public var selectedEmojiCategoryIndex = Observ<Int>(value: 0)
    
    /// All emoji categories
    private var emojiCategories = [EmojiCategory]()
    
    init(unicodeManager: UnicodeManagerProtocol = UnicodeManager()) {
        emojiCategories = unicodeManager.getEmojisForCurrentIOSVersion()
    }
    
    public func numberOfSections() -> Int {
        return emojiCategories.count
    }
    
    public func numberOfItems(in section: Int) -> Int {
        return emojiCategories[section].emojis.count
    }
    
    public func emoji(at indexPath: IndexPath) -> String {
        return emojiCategories[indexPath.section].emojis[indexPath.row].emoji()
    }
    
    public func sectionHeaderViewModel(for section: Int) -> String {
        return emojiCategories[section].categoryName
    }
}
