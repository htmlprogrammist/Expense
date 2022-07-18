//
//  EmojiPicker.swift
//  
//
//  Created by Егор Бадмаев on 17.07.2022.
//

import UIKit

public enum EmojiPicker {
    public static func present(with configuration: Configuration) {
        /// Source view controller must conform `EmojiPickerDelegate` protocol, otherwise do nothing
        guard let delegate = configuration.sourceViewController as? EmojiPickerDelegate else { return }
        let viewController = EmojiPickerViewController()
        viewController.delegate = delegate
        viewController.sourceView = configuration.sender
        viewController.selectedEmojiCategoryTintColor = configuration.selectedEmojiCategoryTintColor
        viewController.arrowDirection = configuration.arrowDirection
        viewController.horizontalInset = configuration.horizontalInset
        viewController.isDismissAfterChoosing = configuration.isDismissAfterChoosing
        viewController.customHeight = configuration.customHeight
        configuration.sourceViewController.present(viewController, animated: true)
    }
}
