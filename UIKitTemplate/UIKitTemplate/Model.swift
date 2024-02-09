// Model.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Model
final class Model {
    // MARK: - Publick propeties

    var userText = " "

    // MARK: - Publick methods
///Метод который разворачивает то что пользователь ввел
    func reversText(text: String) {
        userText = String(text.reversed())
    }
}
