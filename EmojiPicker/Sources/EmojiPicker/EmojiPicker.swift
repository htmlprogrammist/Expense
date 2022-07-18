//
//  EmojiPicker.swift
//  
//
//  Created by Егор Бадмаев on 17.07.2022.
//

import UIKit

public enum EmojiPicker {
    public struct Configuration {
        public var sourceViewController: UIViewController
        public var sender: UIView
        public var selectedEmojiCategoryTintColor: UIColor?
        public var arrowDirection: PickerArrowDirectionMode
        public var horizontalInset: CGFloat
        public var isDismissAfterChoosing: Bool
        public var customHeight: CGFloat?
        
        public init(sourceViewController: UIViewController,
                    sender: UIView,
                    selectedEmojiCategoryTintColor: UIColor? = nil,
                    arrowDirection: PickerArrowDirectionMode = .up,
                    horizontalInset: CGFloat = 0,
                    isDismissAfterChoosing: Bool = true,
                    customHeight: CGFloat? = nil
        ) {
            self.sourceViewController = sourceViewController
            self.sender = sender
            self.selectedEmojiCategoryTintColor = selectedEmojiCategoryTintColor
            self.arrowDirection = arrowDirection
            self.horizontalInset = horizontalInset
            self.isDismissAfterChoosing = isDismissAfterChoosing
            self.customHeight = customHeight
        }
    }
    
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
