// SigInViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Стартовый экран приложения
final class SigInViewController: UIViewController, UITextFieldDelegate {
    // MARK: - Private propeties

    @IBOutlet var hiddenBuutton: UIButton!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var signInButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldDidChange()
        passwordTextField.delegate = self
        loginTextField.delegate = self
        signInButton.layer.cornerRadius = 12
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    /// метод для просмотра пароля
    @IBAction func changeHidenPassword(_ sender: Any) {
        passwordTextField.isSecureTextEntry.toggle()
        hiddenBuutton.setImage(
            UIImage(systemName: !passwordTextField.isSecureTextEntry ? "eye.fill" : "eye.slash.fill"),
            for: .normal
        )
    }

    @objc func textFieldDidChange() {
        guard let login = loginTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        if let text = passwordTextField.text, !text.isEmpty {
            /// Если текстовое поле не пустое, активируем кнопку
            signInButton.isEnabled = true
            signInButton.backgroundColor = #colorLiteral(red: 0.08282069117, green: 0.7389982343, blue: 0.8026565909, alpha: 1)

        } else {
            /// Если текстовое поле пустое, деактивируем кнопку
            signInButton.isEnabled = false
            signInButton.backgroundColor = #colorLiteral(red: 0.5391739607, green: 0.8704951406, blue: 0.9009439349, alpha: 1)
            signInButton.setTitleColor(.white, for: .normal)
        }
    }
}
