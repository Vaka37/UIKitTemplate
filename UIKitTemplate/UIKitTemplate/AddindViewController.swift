// AddindViewController.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Класс для добавления нового иммениника
final class AddindViewController: UIViewController {
    // MARK: - Visual components

    /// кнопка добавить именниника
    private var addingButton = UIButton()
    /// кнопка закрыть экран
    private var cancelButton = UIButton()
    /// кнопка сменить аватар
    private var changeAvatarButton = UIButton()
    /// кастомная вьюшка с леблом имя и текстфилдом
    private var nameView = CustomComponents()
    /// кастомная вьюшка с леблом дня рождения и текстфилдом
    private var birthDay = CustomComponents()
    /// кастомная вьюшка с леблом возраста и текстфилдом
    private var ageView = CustomComponents()
    /// кастомная вьюшка с леблом полом и текстфилдом
    private var genderView = CustomComponents()
    /// кастомная вьюшка с леблом телеграма и текстфилдом
    private var telegrammView = CustomComponents()
    /// пикер с выбором пола
    private var pickerGender = UIPickerView()
    /// пикер с выбором возраста
    private var agePicker = UIPickerView()
    /// пикер с выбором даты
    private var datePicker = UIDatePicker(frame: .zero)
    /// Дата из пикера
    private var pickerValueDate = Date()
    /// Текст из пикера
    var textFromPicker = ""
    private var avatarUser: UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "defautIcon")
        image.frame = CGRect(x: 0, y: 66, width: 125, height: 125)
        image.center.x = view.center.x
        return image
    }

    // MARK: - Private propites

    private var model: Model?

    // MARK: - Public propites

    var closure: ((_ text: Model) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private  methods

    /// кладем компоненты на вью
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(avatarUser)
        createButtons(button: addingButton, lineX: 325, title: "Add", target: #selector(addingUser))
        createButtons(button: cancelButton, lineX: 20, title: "Cancel", target: #selector(closeViewController))
        createButtons(
            button: changeAvatarButton,
            lineX: 125,
            lineY: 199,
            title: "Change photo",
            target: #selector(closeViewController),
            width: 125
        )
        createCustomView(customView: nameView, title: "Name Surname", placeholder: "Typing Name Surname", lineY: 239)
        createCustomView(customView: birthDay, title: "Birthday", placeholder: "Typing Date of Birth", lineY: 314)
        createCustomView(customView: ageView, title: "Age", placeholder: "Typing age", lineY: 389)
        createCustomView(customView: genderView, title: "Gender", placeholder: "Indicate Gender", lineY: 462)
        createCustomView(customView: telegrammView, title: "Telegramm", placeholder: "Typing Telegram", lineY: 537)
        telegrammView.textField.delegate = self
        telegrammView.textField.addTarget(self, action: #selector(textFieldDidBeginEditing), for: .touchUpInside)
        inputPickerView()
        createToolBar(textField: genderView.textField, buttonTitle: "Ok", action: #selector(toolBarDoneGender))
        createToolBar(textField: ageView.textField, buttonTitle: "Ok", action: #selector(toolBarDone))
        createToolBar(
            textField: birthDay.textField,
            buttonTitle: "Done",
            action: #selector(datePickerChange)
        )
    }

    /// метод для создания кнопок
    private func createButtons(
        button: UIButton,
        lineX: Int,
        lineY: Int = 15,
        title: String,
        target: Selector,
        width: Int = 50
    ) {
        button.frame = CGRect(x: lineX, y: lineY, width: width, height: 20)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: target, for: .touchUpInside)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(button)
    }

    /// добавление кастомной вью
    private func createCustomView(customView: CustomComponents, title: String, placeholder: String, lineY: Int) {
        customView.frame = CGRect(x: 16, y: lineY, width: 325, height: 100)
        customView.titleLabel.text = title
        customView.textField.placeholder = placeholder
        view.addSubview(customView)
    }

    /// Подписываем наши пикеры на дилегаты и дата сорс
    private func createPickerView(picker: UIPickerView) {
        picker.delegate = self
        picker.dataSource = self
    }

    /// Присваеваем нашим текст филдам пикеры
    private func inputPickerView() {
        createPickerView(picker: pickerGender)
        createPickerView(picker: agePicker)
        genderView.textField.inputView = pickerGender
        ageView.textField.inputView = agePicker
        birthDay.textField.inputView = datePicker
        createDatePicker()
    }

    /// создаемм дата пикер
    private func createDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(datePickerChange), for: .valueChanged)
    }

    /// Создаем тул бар и  приссваеваем пикерам
    func createToolBar(textField: UITextField, buttonTitle: String, action: Selector?) {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let spacingButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let buttonPicker = UIBarButtonItem(
            title: buttonTitle,
            style: .plain,
            target: nil,
            action: action
        )
        toolBar.setItems([spacingButton, buttonPicker], animated: true)
        textField.inputAccessoryView = toolBar
    }

    /// присвоить возраст
    @objc func toolBarDone() {
        ageView.textField.text = textFromPicker
        view.endEditing(true)
    }

    /// присвоить гендер
    @objc func toolBarDoneGender() {
        genderView.textField.text = textFromPicker
        view.endEditing(true)
    }

    /// присвоить деньрождение
    @objc func datePickerChange(paramDatePickker: UIDatePicker) {
        if paramDatePickker.isEqual(datePicker) {
            birthDay.textField.text = paramDatePickker.date.formatted(date: .numeric, time: .omitted)
            pickerValueDate = paramDatePickker.date
        }
        view.endEditing(true)
    }

    // метода для закрытия контроллера
    @objc private func closeViewController() {
        dismiss(animated: true)
    }

    /// метод для добавления нового именниника
    @objc private func addingUser() {
        let model = Model(name: nameView.textField.text, date: pickerValueDate)
        closure?(model)
        dismiss(animated: true)
    }
}

/// Расширение для контроллера с добавлением данных именниника
extension AddindViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let alert = UIAlertController(title: "Please enter Telegram", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            textField.text = alert.textFields?.first?.text
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(action)
        alert.addTextField()
        alert.preferredAction = action
        present(alert, animated: true)
    }
}

extension AddindViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == agePicker {
            60
        } else {
            2
        }
    }
}

extension AddindViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == agePicker {
            textFromPicker = ""
            textFromPicker = "\(row + 1)"
            return "\(row + 1)"
        } else {
            switch row {
            case 0:
                textFromPicker = "Male"
                return "Male"
            case 1:
                textFromPicker = "Female"
                return "Female"
            default:
                break
            }
        }
        return nil
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == ageView.textField {
        } else if pickerView == genderView.textField {
            textFromPicker = String(row + 1)
        }
    }
}
