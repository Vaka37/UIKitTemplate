// BookingViewController.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// вью контроллер ддля бронирования столика
final class BookingViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var priceButton: UIButton!
    /// метод для вызова алерта
    @IBAction func chargingPrice(_ sender: Any) {
        callAlert(title: "Выставить счет?", titleButton: "Чек", action: getPrice)
    }

    // MARK: - Private Methods

    /// метода ддля перехода на контроллер с ценной
    private func getPrice() {
        guard let priceVC = storyboard?.instantiateViewController(identifier: "priceVC") as? PriceViewController else {
            return
        }
        navigationController?.pushViewController(priceVC, animated: true)
    }
}

/// расширение
extension UIViewController {
    func callAlert(title: String, titleButton: String, action: @escaping () -> ()) {
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: titleButton, style: .default) { _ in
            action()
        }
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addAction(action)
        alert.addAction(actionCancel)
        present(alert, animated: true, completion: nil)
    }
}
