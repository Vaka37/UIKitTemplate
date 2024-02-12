// SignInViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Статртовый экран приложения
final class SignInViewController: UIViewController {
    // MARK: - visual components

    private var birthdayLabel = UILabel()
    private var signInLabel = UILabel()
    private var loginLabel = UILabel()
    private var passwordLabel = UILabel()
    private var loginTexxtField = UITextField()
    private var faceIdLabel = UILabel()
    private var loginTextField = UITextField()
    private var passwordTextField = UITextField()
    private var lineView = UIView()
    private var lineViewTwo = UIView()

    private var imageBirthday: UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "imageBirthday")
        image.frame = CGRect(x: 0, y: 70, width: 125, height: 125)
        image.center.x = view.center.x
        return image
    }

    private var faceIdSwitch: UISwitch {
        let switchComponent = UISwitch()
        switchComponent.isOn = false
        switchComponent.frame = CGRect(x: Int(view.center.x) + 30, y: 500, width: 0, height: 0)
        return switchComponent
    }

    /// кнопка показать скрыть пароль
    private var showPasswordButton = UIButton()

    /// кнопка для перехода на следующую вью
    private var sigUpButton = UIButton()

    // MARK: - Life Cicly

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUi()
    }

    // MARK: - private methods

    // кладем компоненты на вью
    private func setUpUi() {
        view.backgroundColor = .white
        view.addSubview(imageBirthday)
        createSignUpButton()
        createLabel(
            label: birthdayLabel,
            lineX: Int(view.center.x) - 40,
            lineY: 190,
            width: 175,
            height: 44,
            title: "Birthday \nReminder",
            color: #colorLiteral(red: 0.3548033834, green: 0.2620160282, blue: 0.5796588063, alpha: 1),
            fontSize: 18
        )
        createLabel(label: signInLabel, lineY: 260, width: 175, height: 31, title: "Sign in", color: .red, fontSize: 26)
        createLabel(label: loginLabel, lineY: 318, width: 175, height: 19, title: "Email", color: .red)
        createLabel(label: passwordLabel, lineY: 393, width: 175, height: 18, title: "Password", color: .red)
        createTextFields(textField: loginTextField, placeholder: "Typing email", lineY: 347)
        createTextFields(
            textField: passwordTextField,
            placeholder: "Typing password",
            lineY: 422,
            isSecure: true
        )
        createLineViwe(view: lineView, lineY: 372)
        createLineViwe(view: lineViewTwo, lineY: 448)
        createShowPasswordButton()
        view.addSubview(sigUpButton)
    }

    /// сшздание лейблов
    private func createLabel(
        label: UILabel,
        lineX: Int = 16,
        lineY: Int,
        width: Int,
        height: Int,
        title: String,
        color: UIColor,
        fontSize: CGFloat = 16
    ) {
        label.frame = CGRect(x: lineX, y: lineY, width: width, height: height)
        label.text = title
        label.textColor = color
        label.font = UIFont(name: "HelveticaNeue-Bold", size: fontSize)
        label.numberOfLines = 0
        view.addSubview(label)
    }

    /// создание textFields
    private func createTextFields(
        textField: UITextField, placeholder: String, lineY: Int, isSecure: Bool = false
    ) {
        textField.placeholder = placeholder
        textField.borderStyle = .none
        textField.isSecureTextEntry = isSecure
        textField.frame = CGRect(x: 16, y: lineY, width: 175, height: 17)
        textField.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingChanged)
        view.addSubview(textField)
    }

    private func createLineViwe(view: UIView, lineY: Int) {
        view.frame = CGRect(x: 16, y: lineY, width: 335, height: 1)
        view.backgroundColor = .gray
        self.view.addSubview(view)
    }

    /// метод для кнопки показывать или сскрывать пароль
    private func createShowPasswordButton() {
        showPasswordButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        showPasswordButton.frame = CGRect(x: 332, y: 419, width: 22, height: 19)
        showPasswordButton.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        showPasswordButton.tintColor = .gray
        view.addSubview(showPasswordButton)
    }

    /// кнопка присоединиться
    private func createSignUpButton() {
        sigUpButton.frame = CGRect(x: 0, y: 671, width: 335, height: 44)
        sigUpButton.center.x = view.center.x
        sigUpButton.backgroundColor = #colorLiteral(red: 0.966547668, green: 0.7107220292, blue: 0.7470796704, alpha: 1)
        sigUpButton.setTitle("Login", for: .normal)
        sigUpButton.layer.cornerRadius = 12
        sigUpButton.isEnabled = false
        sigUpButton.addTarget(self, action: #selector(pushSecondVC), for: .touchUpInside)
        view.addSubview(sigUpButton)
    }

    @objc private func showPassword() {
        passwordTextField.isSecureTextEntry.toggle()
        showPasswordButton.setImage(
            UIImage(systemName: passwordTextField.isSecureTextEntry ? "eye.slash.fill" : "eye.fill"),
            for: .normal
        )
    }

    /// переход на следующий контроллер
    @objc private func pushSecondVC() {
        let secondViewController = DetailViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}

// MARK: - extension

extension SignInViewController: UITextFieldDelegate {
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        let textPassword = passwordTextField.text ?? ""
        let textLogIn = passwordTextField.text ?? ""
        if !textPassword.isEmpty, !textLogIn.isEmpty {
            sigUpButton.backgroundColor = .red
            sigUpButton.isEnabled = true
            createLabel(
                label: faceIdLabel,
                lineX: Int(view.center.x) - 70,
                lineY: 500,
                width: 150,
                height: 35,
                title: "Use FaceID",
                color: .black
            )
            view.addSubview(faceIdSwitch)
        } else {
            sigUpButton.backgroundColor = #colorLiteral(red: 0.966547668, green: 0.7107220292, blue: 0.7470796704, alpha: 1)
            sigUpButton.isEnabled = false
            faceIdLabel.removeFromSuperview()
            faceIdSwitch.removeFromSuperview()
        }
    }
}
