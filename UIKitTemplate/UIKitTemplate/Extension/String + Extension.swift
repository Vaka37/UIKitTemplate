// String + Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширенние для валлидации строки
extension String {
    /// Расширение для изменение шрифта
    /// - Parameters:
    /// - font: шрифт который надо использовать
    /// - ofSubstring: иизменяемое значение
    /// - Returns: модифицированнуюю строку
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
