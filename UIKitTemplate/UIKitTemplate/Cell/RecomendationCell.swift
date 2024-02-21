// RecomendationCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с реккомендациями
final class RecomendationCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let identefire = "RecomentadionCell"
        static let titleCell = "Рекомендуем вам"
        static let allButtonTitle = "Все"
        static let subsribe = "Подписаться"
    }

    // MARK: - Visual Components

    private lazy var contentScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: frame.size.width * 2, height: frame.size.height)
        scroll.showsHorizontalScrollIndicator = false
        scroll.backgroundColor = UIColor.recomentationBackground
        return scroll
    }()

    private lazy var recomentadionLabel: UILabel = {
        let title = UILabel()
        title.text = Constants.titleCell
        title.textColor = .black
        title.font = UIFont.boldSystemFont(ofSize: 10)
        return title
    }()

    private lazy var allButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.allButtonTitle, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        button.contentHorizontalAlignment = .trailing
        return button
    }()

    private lazy var overlayView: UIView = {
        let overlayView = UIView()
        overlayView.backgroundColor = .white
        return overlayView

    }()

    private lazy var avatarUserImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()

    private lazy var loginUserLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 10)
        label.sizeToFit()
        label.textAlignment = .center
        return label
    }()

    private lazy var subscribeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .systemBlue
        button.setTitle(Constants.subsribe, for: .normal)
        return button
    }()

    private lazy var overlaySecondView: UIView = {
        let overlayView = UIView()
        overlayView.backgroundColor = .white
        return overlayView

    }()

    private lazy var avatarUserSecondImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()

    private lazy var loginUserSecondLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 10)
        label.sizeToFit()
        label.textAlignment = .center
        return label
    }()

    private lazy var subscribeSecondButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .systemBlue
        button.setTitle(Constants.subsribe, for: .normal)
        return button
    }()

    // MARK: - Public Properties

    func confiUI(data: [Recomendation]) {
        avatarUserImageView.image = UIImage(named: data[0].avatar)
        loginUserLabel.text = data[0].login
        avatarUserSecondImageView.image = UIImage(named: data[1].avatar)
        loginUserSecondLabel.text = data[1].login
        addSubview(contentScrollView)
        contentScrollView.addSubview(overlayView)
        contentScrollView.addSubview(recomentadionLabel)
        contentScrollView.addSubview(allButton)
        contentScrollView.addSubview(overlaySecondView)
        overlayView.addSubview(avatarUserImageView)
        overlayView.addSubview(loginUserLabel)
        overlayView.addSubview(subscribeButton)
        overlaySecondView.addSubview(avatarUserSecondImageView)
        overlaySecondView.addSubview(loginUserSecondLabel)
        overlaySecondView.addSubview(subscribeSecondButton)
        makeAnchor()
    }

    func makeAnchor() {
        createScrollViewAnchor()
        createOverlayViewAnchor()
        createSecondOverlayViewAnchor()
        createRecomendationLabelAnchor()
        createAllButtonAnchor()
        createAvatarUserAnchor()
        createLoginUserAnchor()
        createSubscribeAnchor()
        createSecondAvatarUserAnchor()
        createSecondLoginUserAnchor()
        createSecondSubscribeButtonAnchor()
    }
}

extension RecomendationCell {
    private func createScrollViewAnchor() {
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        contentScrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentScrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentScrollView.widthAnchor.constraint(equalToConstant: 600).isActive = true
    }

    private func createOverlayViewAnchor() {
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        overlayView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor, constant: 17).isActive = true
        overlayView.centerYAnchor.constraint(equalTo: contentScrollView.centerYAnchor).isActive = true
        overlayView.widthAnchor.constraint(equalToConstant: 185).isActive = true
        overlayView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    private func createSecondOverlayViewAnchor() {
        overlaySecondView.translatesAutoresizingMaskIntoConstraints = false
        overlaySecondView.leadingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: 20).isActive = true
        overlaySecondView.centerYAnchor.constraint(equalTo: contentScrollView.centerYAnchor).isActive = true
        overlaySecondView.widthAnchor.constraint(equalToConstant: 185).isActive = true
        overlaySecondView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    private func createRecomendationLabelAnchor() {
        recomentadionLabel.translatesAutoresizingMaskIntoConstraints = false
        recomentadionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        recomentadionLabel.topAnchor.constraint(equalTo: contentScrollView.topAnchor, constant: 9).isActive = true
        recomentadionLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        recomentadionLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func createAllButtonAnchor() {
        allButton.translatesAutoresizingMaskIntoConstraints = false
        allButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        allButton.topAnchor.constraint(equalTo: contentScrollView.topAnchor, constant: 9).isActive = true
        allButton.widthAnchor.constraint(equalToConstant: 107).isActive = true
        allButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func createAvatarUserAnchor() {
        avatarUserImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarUserImageView.topAnchor.constraint(equalTo: overlayView.topAnchor, constant: 15).isActive = true
        avatarUserImageView.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor).isActive = true
        avatarUserImageView.widthAnchor.constraint(equalToConstant: 115).isActive = true
        avatarUserImageView.heightAnchor.constraint(equalToConstant: 115).isActive = true
    }

    private func createLoginUserAnchor() {
        loginUserLabel.translatesAutoresizingMaskIntoConstraints = false
        loginUserLabel.centerXAnchor.constraint(equalTo: avatarUserImageView.centerXAnchor).isActive = true
        loginUserLabel.topAnchor.constraint(equalTo: avatarUserImageView.bottomAnchor, constant: 5).isActive = true
        loginUserLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loginUserLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func createSubscribeAnchor() {
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        subscribeButton.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 10).isActive = true
        subscribeButton.topAnchor.constraint(equalTo: loginUserLabel.bottomAnchor, constant: 9).isActive = true
        subscribeButton.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -10).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func createSecondAvatarUserAnchor() {
        avatarUserSecondImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarUserSecondImageView.topAnchor.constraint(equalTo: overlaySecondView.topAnchor, constant: 15)
            .isActive = true
        avatarUserSecondImageView.centerXAnchor.constraint(equalTo: overlaySecondView.centerXAnchor).isActive = true
        avatarUserSecondImageView.widthAnchor.constraint(equalToConstant: 115).isActive = true
        avatarUserSecondImageView.heightAnchor.constraint(equalToConstant: 115).isActive = true
    }

    private func createSecondLoginUserAnchor() {
        loginUserSecondLabel.translatesAutoresizingMaskIntoConstraints = false
        loginUserSecondLabel.centerXAnchor.constraint(equalTo: avatarUserSecondImageView.centerXAnchor).isActive = true
        loginUserSecondLabel.topAnchor.constraint(equalTo: avatarUserSecondImageView.bottomAnchor, constant: 5)
            .isActive = true
        loginUserSecondLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loginUserSecondLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func createSecondSubscribeButtonAnchor() {
        subscribeSecondButton.translatesAutoresizingMaskIntoConstraints = false
        subscribeSecondButton.leadingAnchor.constraint(equalTo: overlaySecondView.leadingAnchor, constant: 10)
            .isActive = true
        subscribeSecondButton.topAnchor.constraint(equalTo: loginUserSecondLabel.bottomAnchor, constant: 9)
            .isActive = true
        subscribeSecondButton.trailingAnchor.constraint(equalTo: overlaySecondView.trailingAnchor, constant: -10)
            .isActive = true
        subscribeSecondButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
