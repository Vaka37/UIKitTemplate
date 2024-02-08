// Controller.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Controller
final class Controller {
    // MARK: - Publick propeties

    static var shared = Controller()
    var model = Model(text: "")

    // MARK: - init

    private init() {}

    // MARK: - Publick methods

    func callAlert(view: UIViewController, action: @escaping () -> ()) {
        let alert = UIAlertController(title: "Введите ваше слово", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            self.model.text = ""
            self.model.text = alert.textFields?.first?.text ?? ""
            action()
        }
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addTextField(configurationHandler: nil)
        alert.textFields?.first?.placeholder = "Введите слово"
        alert.addAction(action)
        alert.addAction(actionCancel)
        view.present(alert, animated: true, completion: nil)
    }
}
