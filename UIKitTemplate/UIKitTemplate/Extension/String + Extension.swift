// String + Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Расширенние для валлидации строки
public extension String {
    /// Рассширение для изменение шрифта
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
