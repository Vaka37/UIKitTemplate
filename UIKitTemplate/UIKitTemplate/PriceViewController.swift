// PriceViewController.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Вью для выставления счета
final class PriceViewController: UIViewController {
    // MARK: - Private methods

    /// переход на заключительный контроллер
    private func goToExitVC() {
        guard let priceVC = storyboard?.instantiateViewController(identifier: "exitVC") as? ExitViewController else {
            return
        }
        priceVC.modalPresentationStyle = .fullScreen
        present(priceVC, animated: true)
    }

    /// вызов алерта что бы оплатить
    @IBAction func callAlert(_ sender: Any) {
        callAlert(title: "Вы хотите оплатить чек?", titleButton: "Да", action: goToExitVC)
    }
}
