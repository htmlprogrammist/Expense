//
//  File.swift
//  
//
//  Created by Егор Бадмаев on 18.07.2022.
//

extension EmojiPicker {
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
}
