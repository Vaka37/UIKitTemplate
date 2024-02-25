// StackViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Сфетофор на стек вью
final class StackViewController: UIViewController {
    // MARK: - Visual Components

    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()

    private var redSquareView: UIView = {
        let red = UIView()
        red.backgroundColor = .red
        return red
    }()

    private var yellowSquareView: UIView = {
        let red = UIView()
        red.backgroundColor = .yellow
        return red
    }()

    private var greenSquareView: UIView = {
        let red = UIView()
        red.backgroundColor = .green
        return red
    }()

    private var blackRectangleView: UIView = {
        let red = UIView()
        red.backgroundColor = .black
        return red
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.addSubview(blackRectangleView)
        blackRectangleView.addSubview(stackView)
        stackView.addArrangedSubview(redSquareView)
        stackView.addArrangedSubview(yellowSquareView)
        stackView.addArrangedSubview(greenSquareView)
        makeStackViewAnchor()
        makeBlackRectangleAnchor()
    }
}

// MARK: - Layoyt

extension StackViewController {
    private func makeStackViewAnchor() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 4).isActive = true
    }

    private func makeBlackRectangleAnchor() {
        blackRectangleView.translatesAutoresizingMaskIntoConstraints = false
        blackRectangleView.topAnchor.constraint(equalTo: redSquareView.topAnchor, constant: -10).isActive = true
        blackRectangleView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10).isActive = true
        blackRectangleView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -10).isActive = true
        blackRectangleView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 10).isActive = true
    }
}
