//
//  String.swift
//  Expense
//
//  Created by Егор Бадмаев on 23.06.2022.
//

import UIKit

extension String {
    /// For simplify localizing texts in the whole application
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
    
    /// Returns attributed string splitted by `character` with provided size and weight
    /// - Parameters:
    ///   - character: the character by which the string will be split
    ///   - ofSize: size of the font
    ///   - weight: font weight
    /// - Returns: Attributed string with second half (after `character`) changed
    func getAttributedString(after character: Character, ofSize: CGFloat, with weight: UIFont.Weight) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: self)
        let index = self.lastIndex(of: character) ?? self.startIndex
        let length = 8 // TODO: fix length counting
        attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: ofSize, weight: weight), range: NSRange(location: (self.distance(from: self.startIndex, to: index)), length: length))
        return attributedText
    }
}
