// StartViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью с которой стартует наше приложкение
final class StartViewController: UIViewController {
    // MARK: - private Properties

    private var guessItemNumber = 8
    private var name = ""

    private var backgroundImage: CALayer {
        let background = CALayer()
        background.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        background.contents = UIImage(named: "background")?.cgImage
        background.contentsGravity = .resizeAspect
        return background
    }

    private var nameLabel: UILabel {
        let text = UILabel()
        text.text = "Приветсвую, \(name)!"
        text.frame = CGRect(x: 70, y: 14, width: 225, height: 100)
        text.textColor = .white
        text.numberOfLines = 2
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 32.0)
        return text
    }

    private var backgroundColorLabel: UIView {
        let backgroundView = UIView()
        backgroundView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 120)
        backgroundView.backgroundColor = #colorLiteral(red: 0.5921974778, green: 0.7959387898, blue: 0.897266984, alpha: 1)
        return backgroundView
    }

    private var guessNumber: UIButton {
        let button = UIButton()
        button.setTitle("Угадай число", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6070119143, green: 0.4975340962, blue: 0.7083145976, alpha: 1)
        button.frame = CGRect(x: 80, y: 285, width: 150, height: 150)
        button.layer.cornerRadius = 30
        button.layer.borderColor = #colorLiteral(red: 0.2971118689, green: 0.1424975097, blue: 0.4514529705, alpha: 1)
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(guessMethod), for: .touchUpInside)
        return button
    }

    private var calculator: UIButton {
        let button = UIButton()
        button.setTitle("Калькулятор", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3955153525, green: 0.7082108259, blue: 0.5093659759, alpha: 1)
        button.frame = CGRect(x: 150, y: 490, width: 200, height: 200)
        button.layer.cornerRadius = 30
        button.layer.borderColor = #colorLiteral(red: 0.2333601415, green: 0.4097964168, blue: 0.2968994677, alpha: 1)
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(callAlertCalculate), for: .touchUpInside)
        return button
    }

    // MARK: - Life Cycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        callAlertStart()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }

    // MARK: - private methods

    /// добаляет на вью лейблы и кнопки
    private func createView() {
        view.backgroundColor = .white
        view.layer.addSublayer(backgroundImage)
        view.addSubview(guessNumber)
        view.addSubview(calculator)
    }

    /// добавляет на вью приветсвие
    private func addingNameView() {
        view.addSubview(backgroundColorLabel)
        view.addSubview(nameLabel)
    }

    /// Вызывает алерт при старте
    private func callAlertStart() {
        let alert = UIAlertController(title: "Пожалуйста, представтесь", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Готово", style: .cancel) { _ in
            self.name = alert.textFields?.first?.text ?? ""
            self.addingNameView()
        })
        alert.addTextField(configurationHandler: nil)
        alert.textFields?.first?.placeholder = "Введите ваше имя"
        present(alert, animated: false, completion: nil)
    }

    /// Метод для кнопки с операциями цисел
    @objc private func callAlertCalculate() {
        calculatorMethod(addTextField: true, title: "Введите ваши числа")
    }

    /// Метод для поиска загадоного числа
    @objc private func guessMethod() {
        searchNumber(guessNumber: guessItemNumber, title: "Угадай число от 1 до 10")
    }
}

/// Расширения для UIViewController
extension UIViewController {
    /// расширения для поиска загадоного числа
    func searchNumber(guessNumber: Int, title: String, message: String? = nil, cancelButton: Bool = true) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .default))
        if cancelButton {
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel) { [self] _ in
                let item = Int(alert.textFields?.first?.text ?? "")
                guard let number = item else { return }
                if number < guessNumber {
                    searchNumber(
                        guessNumber: guessNumber,
                        title: "Попробуйте еще раз",
                        message: "Вы ввели слишком маленькое число"
                    )
                } else if number > guessNumber {
                    searchNumber(
                        guessNumber: guessNumber,
                        title: "Попробуйте еще раз",
                        message: "Вы ввели слишком большое число"
                    )
                } else {
                    searchNumber(
                        guessNumber: guessNumber,
                        title: "Поздравляю!",
                        message: "Вы угадали",
                        cancelButton: false
                    )
                }
            })
            alert.addTextField(configurationHandler: nil)
            alert.textFields?.first?.placeholder = "Введите число"
        }
        present(alert, animated: false, completion: nil)
    }

    /// Расширение для операций с цислами в алерте
    func calculatorMethod(
        operationButton: Bool = false,
        addTextField: Bool = false,
        title: String,
        message: String? = nil,
        numberOne: Int? = nil,
        numberTwo: Int? = nil
    ) {
        var numberOne = numberOne
        var numberTwo = numberTwo
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if addTextField {
            alert.addAction(UIAlertAction(title: "Выбрать операцию", style: .cancel) { [self] _ in
                numberOne = Int(alert.textFields?.first?.text ?? "") ?? 0
                numberTwo = Int(alert.textFields?.last?.text ?? "") ?? 0
                calculatorMethod(
                    operationButton: true,
                    addTextField: false,
                    title: "Выберете математическую операцию",
                    numberOne: numberOne,
                    numberTwo: numberTwo
                )
            })
        }
        alert.addAction(UIAlertAction(title: "Отмена", style: addTextField ? .default : .cancel))
        if operationButton {
            alert.addAction(UIAlertAction(title: "Сложить", style: .default) { [self] _ in
                calculatorMethod(
                    addTextField: false,
                    title: "Ваш результат",
                    message: "\(Int(numberOne ?? 0) + Int(numberTwo ?? 0))"
                )
            })
            alert.addAction(UIAlertAction(title: "Вычесть", style: .default) { [self] _ in
                calculatorMethod(
                    addTextField: false,
                    title: "Ваш результат",
                    message: "\(Int(numberOne ?? 0) - Int(numberTwo ?? 0))"
                )
            })
            alert.addAction(UIAlertAction(title: "Умножить", style: .default) { [self] _ in
                calculatorMethod(
                    addTextField: false,
                    title: "Ваш результат",
                    message: "\(Int(numberOne ?? 0) * Int(numberTwo ?? 0))"
                )
            })
            alert.addAction(UIAlertAction(title: "Разделить", style: .default) { [self] _ in
                calculatorMethod(
                    addTextField: false,
                    title: "Ваш результат",
                    message: "\(Int(numberOne ?? 0) / Int(numberTwo ?? 0))"
                )
            })
        }
        if addTextField {
            alert.addTextField(configurationHandler: nil)
            alert.addTextField(configurationHandler: nil)
            alert.textFields?.first?.placeholder = "Число 1"
            alert.textFields?.last?.placeholder = "Число 2"
        }
        present(alert, animated: true, completion: nil)
    }
}
