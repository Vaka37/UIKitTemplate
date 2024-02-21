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

    private lazy var avatarUser: UIImageView = {
        let image = UIImageView()
        return image
    }()

    private lazy var loginUser: UILabel = {
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

    private lazy var overlayViewSecond: UIView = {
        let overlayView = UIView()
        overlayView.backgroundColor = .white
        return overlayView

    }()

    private lazy var avatarUserSecond: UIImageView = {
        let image = UIImageView()
        return image
    }()

    private lazy var loginUserSecond: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 10)
        label.sizeToFit()
        label.textAlignment = .center
        return label
    }()

    private lazy var subscribeButtonSecond: UIButton = {
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
        avatarUser.image = UIImage(named: data[0].avatar)
        loginUser.text = data[0].login
        avatarUserSecond.image = UIImage(named: data[1].avatar)
        loginUserSecond.text = data[1].login
        addSubview(contentScrollView)
        contentScrollView.addSubview(overlayView)
        contentScrollView.addSubview(recomentadionLabel)
        contentScrollView.addSubview(allButton)
        contentScrollView.addSubview(overlayViewSecond)
        overlayView.addSubview(avatarUser)
        overlayView.addSubview(loginUser)
        overlayView.addSubview(subscribeButton)
        overlayViewSecond.addSubview(avatarUserSecond)
        overlayViewSecond.addSubview(loginUserSecond)
        overlayViewSecond.addSubview(subscribeButtonSecond)
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
        overlayViewSecond.translatesAutoresizingMaskIntoConstraints = false
        overlayViewSecond.leadingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: 20).isActive = true
        overlayViewSecond.centerYAnchor.constraint(equalTo: contentScrollView.centerYAnchor).isActive = true
        overlayViewSecond.widthAnchor.constraint(equalToConstant: 185).isActive = true
        overlayViewSecond.heightAnchor.constraint(equalToConstant: 200).isActive = true
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
        avatarUser.translatesAutoresizingMaskIntoConstraints = false
        avatarUser.topAnchor.constraint(equalTo: overlayView.topAnchor, constant: 15).isActive = true
        avatarUser.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor).isActive = true
        avatarUser.widthAnchor.constraint(equalToConstant: 115).isActive = true
        avatarUser.heightAnchor.constraint(equalToConstant: 115).isActive = true
    }

    private func createLoginUserAnchor() {
        loginUser.translatesAutoresizingMaskIntoConstraints = false
        loginUser.centerXAnchor.constraint(equalTo: avatarUser.centerXAnchor).isActive = true
        loginUser.topAnchor.constraint(equalTo: avatarUser.bottomAnchor, constant: 5).isActive = true
        loginUser.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loginUser.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func createSubscribeAnchor() {
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        subscribeButton.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 10).isActive = true
        subscribeButton.topAnchor.constraint(equalTo: loginUser.bottomAnchor, constant: 9).isActive = true
        subscribeButton.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -10).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func createSecondAvatarUserAnchor() {
        avatarUserSecond.translatesAutoresizingMaskIntoConstraints = false
        avatarUserSecond.topAnchor.constraint(equalTo: overlayViewSecond.topAnchor, constant: 15).isActive = true
        avatarUserSecond.centerXAnchor.constraint(equalTo: overlayViewSecond.centerXAnchor).isActive = true
        avatarUserSecond.widthAnchor.constraint(equalToConstant: 115).isActive = true
        avatarUserSecond.heightAnchor.constraint(equalToConstant: 115).isActive = true
    }

    private func createSecondLoginUserAnchor() {
        loginUserSecond.translatesAutoresizingMaskIntoConstraints = false
        loginUserSecond.centerXAnchor.constraint(equalTo: avatarUserSecond.centerXAnchor).isActive = true
        loginUserSecond.topAnchor.constraint(equalTo: avatarUserSecond.bottomAnchor, constant: 5).isActive = true
        loginUserSecond.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loginUserSecond.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func createSecondSubscribeButtonAnchor() {
        subscribeButtonSecond.translatesAutoresizingMaskIntoConstraints = false
        subscribeButtonSecond.leadingAnchor.constraint(equalTo: overlayViewSecond.leadingAnchor, constant: 10)
            .isActive = true
        subscribeButtonSecond.topAnchor.constraint(equalTo: loginUserSecond.bottomAnchor, constant: 9).isActive = true
        subscribeButtonSecond.trailingAnchor.constraint(equalTo: overlayViewSecond.trailingAnchor, constant: -10)
            .isActive = true
        subscribeButtonSecond.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
