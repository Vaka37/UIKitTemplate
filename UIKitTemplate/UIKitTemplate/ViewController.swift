// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// class ViewController
final class ViewController: UIViewController {
    // MARK: - Private propeties

    private lazy var controller = Controller.shared

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
        title.text = controller.model.text
        return title
    }

    private var resultText: UILabel {
        let title = UILabel()
        title.textColor = .lightGray
        title.frame = CGRect(x: 0, y: 350, width: 275, height: 58)
        title.center.x = view.center.x
        title.textAlignment = .center
        title.text = String(controller.model.text.reversed())
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

    private var startButton2: UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 420, width: 320, height: 44)
        // button.center = view.center
        button.backgroundColor = #colorLiteral(red: 0.2970071137, green: 0.8474416137, blue: 0.3990950882, alpha: 1)
        button.layer.cornerRadius = 12
        button.setTitle("Начать", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(callAler2t), for: .touchUpInside)
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

    @objc private func callAlert() {
        controller.callAlert(view: self, action: addResult)
    }

    @objc private func callAler2t() {
        startButton2.removeFromSuperview()
    }

    private func addResult() {
        view.addSubview(topTitle)
        view.addSubview(bottomTitle)
        view.addSubview(addText)
        view.addSubview(resultText)
        view.addSubview(startButton2)
    }
}
