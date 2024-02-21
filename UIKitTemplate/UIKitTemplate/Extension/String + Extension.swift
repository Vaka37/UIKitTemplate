// String + Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Рассширение для изменение шрифта
public extension String {
    func setFont(_ font: UIFont, ofSubstring substring: String) -> NSMutableAttributedString {
        let range = (self as NSString).range(of: substring)
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(
            NSAttributedString.Key.font,
            value: font,
            range: range
        )
        return attributedString
    }
}
