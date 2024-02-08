// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// start ViewController
final class ViewController: UIViewController {
    // MARK: - private Properties

    private let controller = Controller.shared
    private var backgroundImage: CALayer {
        let background = CALayer()
        background.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        background.contents = UIImage(named: "background")?.cgImage
        background.contentsGravity = .resizeAspect
        return background
    }

    private var nameLabel: UILabel {
        let text = UILabel()
        text.text = "Приветсвую, \(controller.userName)!"
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
        controller.alertStart(view: self, action: addingNameView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }

    // MARK: - private methods

    private func createView() {
        view.backgroundColor = .white
        view.layer.addSublayer(backgroundImage)
        view.addSubview(guessNumber)
        view.addSubview(calculator)
    }

    private func addingNameView() {
        view.addSubview(backgroundColorLabel)
        view.addSubview(nameLabel)
    }

    @objc private func callAlertCalculate() {
        controller.calculatorAlert(view: self)
    }

    @objc private func guessMethod() {
        controller.guessNumber(view: self)
    }
}
