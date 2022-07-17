//
//  EmojiPicker.swift
//  
//
//  Created by Егор Бадмаев on 17.07.2022.
//

import UIKit

public enum EmojiPicker {
    public static func present(sourceViewController: UIViewController, sender: UIView) {
        guard let delegate = sourceViewController as? EmojiPickerDelegate else { return }
        let viewController = EmojiPickerViewController()
        viewController.delegate = delegate
        viewController.sourceView = sender
        sourceViewController.present(viewController, animated: true)
    }
}
