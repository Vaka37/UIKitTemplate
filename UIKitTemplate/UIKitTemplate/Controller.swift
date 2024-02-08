// Controller.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Controller uiView
final class Controller {
    // MARK: - Publick properties

    static let shared = Controller()
    var userName = ""

    // MARK: - Private properties

    private var numberOne = 0
    private var numberTwo = 0
    private var guessNumber = 8

    // MARK: - Init

    private init() {}

    // MARK: - public methods

    func alertStart(view: UIViewController, action: @escaping () -> ()) {
        let alert = UIAlertController(title: "Пожалуйста, представтесь", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Готово", style: .cancel) { _ in
            self.userName = alert.textFields?.first?.text ?? ""
            action()
        })
        alert.addTextField(configurationHandler: nil)
        alert.textFields?.first?.placeholder = "Введите ваше имя"
        view.present(alert, animated: false, completion: nil)
    }

    func calculatorAlert(view: UIViewController) {
        let alert = UIAlertController(title: "Введите ваши числа", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Выбрать операцию", style: .default) { _ in
            self.numberOne = Int(alert.textFields?.first?.text ?? "") ?? 0
            self.numberTwo = Int(alert.textFields?.last?.text ?? "") ?? 0
            self.changeMethodCalculator(view: view)
        })
        alert.addAction(UIAlertAction(title: "Отмена", style: .default))
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.textFields?.first?.placeholder = "Число 1"
        alert.textFields?.last?.placeholder = "Число 2"
        view.present(alert, animated: true, completion: nil)
    }

    func guessNumber(view: UIViewController) {
        let alert = UIAlertController(title: "Угадай число от 1 до 10", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .default))
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel) { [self] _ in
            let item = Int(alert.textFields?.first?.text ?? "")
            guard let number = item else { return }
            if number < guessNumber {
                callAlertGuessNumberLow(view: view)
            } else if number > guessNumber {
                callAlertGuessNumberHigh(view: view)
            } else {
                callAlertGuessNumberEquls(view: view)
            }
        })
        alert.addTextField(configurationHandler: nil)
        alert.textFields?.first?.placeholder = "Введите число"
        view.present(alert, animated: false, completion: nil)
    }

    // MARK: - Private methods

    private func changeMethodCalculator(view: UIViewController) {
        let alert = UIAlertController(title: "Выберете математическую операцию", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Сложить", style: .default) { [self] _ in
            addResultMethod(view: view, result: numberOne + numberTwo)
        })
        alert.addAction(UIAlertAction(title: "Вычесть", style: .default) { [self] _ in
            addResultMethod(view: view, result: numberOne - numberTwo)
        })
        alert.addAction(UIAlertAction(title: "Умножить", style: .default) { [self] _ in
            addResultMethod(view: view, result: numberOne * numberTwo)
        })
        alert.addAction(UIAlertAction(title: "Разделить", style: .default) { [self] _ in
            addResultMethod(view: view, result: numberOne / numberTwo)
        })
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))

        view.present(alert, animated: true, completion: nil)
    }

    private func addResultMethod(view: UIViewController, result: Int) {
        let alert = UIAlertController(title: "Ваш результат", message: "\(result)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        view.present(alert, animated: true, completion: nil)
    }

    private func callAlertGuessNumberLow(view: UIViewController) {
        let alert = UIAlertController(
            title: "Попробуйте еще раз",
            message: "Вы ввели слишком маленькое число",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        view.present(alert, animated: true, completion: nil)
    }

    private func callAlertGuessNumberHigh(view: UIViewController) {
        let alert = UIAlertController(
            title: "Попробуйте еще раз",
            message: "Вы ввели слишком большое число",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Отмена", style: .default))
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        view.present(alert, animated: true, completion: nil)
    }

    private func callAlertGuessNumberEquls(view: UIViewController) {
        let alert = UIAlertController(title: "Поздравляю!", message: "Вы угадали", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        view.present(alert, animated: true, completion: nil)
    }
}
