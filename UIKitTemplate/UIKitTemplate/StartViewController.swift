// StartViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// стартовый экран приложения
final class StartViewController: UIViewController {
    // MARK: - Private propeties

    private lazy var model = Model()

    private lazy var userText = ""

    private var topTitle: UILabel {
        let title = UILabel()
        title.text = "Вы ввели слово"
        title.textColor = .black
        title.frame = CGRect(x: 0, y: 140, width: 275, height: 58)
        title.center.x = view.center.x
        title.textAlignment = .center
        title.font = UIFont(name: "HelveticaNeue-Bold", size: 16.0)
        return title
    }

    private var addText: UILabel {
        let title = UILabel()
        title.textColor = .lightGray
        title.frame = CGRect(x: 0, y: 170, width: 275, height: 58)
        title.center.x = view.center.x
        title.textAlignment = .center
        title.text = userText
        return title
    }

    private var resultText: UILabel {
        let title = UILabel()
        title.textColor = .lightGray
        title.frame = CGRect(x: 0, y: 350, width: 275, height: 58)
        title.center.x = view.center.x
        title.textAlignment = .center
        title.text = String(model.userText)
        return title
    }

    private var bottomTitle: UILabel {
        let title = UILabel()
        title.text = "А вот что получится, если читать справо налево"
        title.textColor = .black
        title.frame = CGRect(x: 0, y: 300, width: 275, height: 58)
        title.center.x = view.center.x
        title.numberOfLines = 2
        title.textAlignment = .center
        title.font = UIFont(name: "HelveticaNeue-Bold", size: 16.0)
        return title
    }

    private var startButton: UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 320, height: 44)
        button.center = view.center
        button.backgroundColor = #colorLiteral(red: 0.2970071137, green: 0.8474416137, blue: 0.3990950882, alpha: 1)
        button.layer.cornerRadius = 12
        button.setTitle("Начать", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(callAlert), for: .touchUpInside)
        return button
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }

    // MARK: - Private methods

    private func createView() {
        view.backgroundColor = .white
        view.addSubview(startButton)
    }

    func createAlert() {
        let alert = UIAlertController(title: "Введите ваше слово", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userText = alert.textFields?.first?.text ?? ""
            self.model.reversText(text: alert.textFields?.first?.text ?? "")
            self.addResult()
        }
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addTextField(configurationHandler: nil)
        alert.textFields?.first?.placeholder = "Введите слово"
        alert.addAction(action)
        alert.addAction(actionCancel)
        present(alert, animated: true, completion: nil)
    }

    @objc private func callAlert() {
        createAlert()
    }

    private func addResult() {
        view.addSubview(topTitle)
        view.addSubview(bottomTitle)
        view.addSubview(addText)
        view.addSubview(resultText)
        startButton.isHidden = true
    }
}
