// UserViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка иинформацией о пользователе
final class UserViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let userCellidentefire = "NotificationButton"
        static let changeButtonTitle = "Изменить"
        static let sharedProfileTitle = "Поделиться профилем"
        static let addinButtonImage = UIImage.profillePlus
        static let webResourse = "www.spacex.com"
        static let postText = "публикации"
        static let subscribersText = "подписчики"
        static let subscriptionsText = "подписки"
    }

    // MARK: - Visual Components

    private var userAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private lazy var webResurseButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("📎 \(Constants.webResourse)", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.titleLabel?.textAlignment = .right
        button.addTarget(self, action: #selector(openWebView), for: .touchUpInside)
        return button
    }()

    private var loginLabel = UILabel()
    private var employeLabel = UILabel()
    private var changeButton = UIButton()
    private var sharedProfile = UIButton()
    private var addButton = UIButton()
    private var countPost = UILabel()
    private var countSubscribers = UILabel()
    private var countSubscriptions = UILabel()
    private var postTextLabel = UILabel()
    private var subscribersTextLabel = UILabel()
    private var subscriptionsTextLabel = UILabel()

    // MARK: - Public Properties

    var transmisionUrl: ((_: String?) -> ())?

    // MARK: - Public Methods

    func configureCell(user: User) {
        webSite = user.webResurse
        userAvatarImageView.image = UIImage(named: user.avatarName)
        loginLabel.text = user.login
        employeLabel.text = user.specialist
        countPost.text = user.countPost
        countSubscribers.text = user.countSubscribers
        countSubscriptions.text = user.countSubscriptions
        makeCell()
        webResurseButton.titleLabel?.textAlignment = .left
    }

    // MARK: - Private Properties

    private lazy var webSite = ""

    private func makeLabel(label: UILabel, font: UIFont = .systemFont(ofSize: 14)) {
        label.font = font
        label.textColor = .black
        contentView.addSubview(label)
    }

    private func makeButton(button: UIButton, title: String?, image: UIImage? = nil) {
        button.setTitle(title, for: .normal)
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 10)
        button.backgroundColor = .systemGray6
        contentView.addSubview(button)
    }

    private func makeCell() {
        contentView.addSubview(userAvatarImageView)
        contentView.addSubview(webResurseButton)
        makeLabel(label: loginLabel, font: UIFont.boldSystemFont(ofSize: 14))
        makeLabel(label: employeLabel)
        makeLabel(label: countPost, font: UIFont.boldSystemFont(ofSize: 14))
        makeLabel(label: countSubscribers, font: UIFont.boldSystemFont(ofSize: 14))
        makeLabel(label: countSubscriptions, font: UIFont.boldSystemFont(ofSize: 14))
        makeLabel(label: postTextLabel, font: .systemFont(ofSize: 10))
        makeLabel(label: subscribersTextLabel, font: .systemFont(ofSize: 10))
        makeLabel(label: subscriptionsTextLabel, font: .systemFont(ofSize: 10))
        makeButton(button: changeButton, title: Constants.changeButtonTitle)
        makeButton(button: sharedProfile, title: Constants.sharedProfileTitle)
        makeButton(button: addButton, title: "", image: Constants.addinButtonImage)
        postTextLabel.text = Constants.postText
        subscribersTextLabel.text = Constants.subscribersText
        subscriptionsTextLabel.text = Constants.subscriptionsText
        makeAnchor()
    }

    private func makeAnchor() {
        makeUserAvatarAnchor()
        makeLoginUserAnchor()
        makePostTextLabelAnchor()
        makeSubscribersTextLabelAnchor()
        makeSubscriptionsTextLabelAnchor()
        makeCountPostAnchor()
        makeCountSubscribersAnchor()
        makeCountSubscriptionsAnchor()
        makeLoginEmployeAnchor()
        makeWebResourseAnchor()
        makeChangeButtonAnchor()
        makeSharedProfileButtonAnchor()
        makeAddingButtonAnchor()
    }

    @objc private func openWebView() {
        transmisionUrl?(webSite)
    }
}

// MARK: - Layoyt

extension UserViewCell {
    private func makeUserAvatarAnchor() {
        userAvatarImageView.translatesAutoresizingMaskIntoConstraints = false
        userAvatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        userAvatarImageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        userAvatarImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        userAvatarImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func makeLoginUserAnchor() {
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.topAnchor.constraint(equalTo: userAvatarImageView.bottomAnchor, constant: 9).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        loginLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        loginLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func makePostTextLabelAnchor() {
        postTextLabel.translatesAutoresizingMaskIntoConstraints = false
        postTextLabel.centerYAnchor.constraint(equalTo: userAvatarImageView.centerYAnchor).isActive = true
        postTextLabel.leadingAnchor.constraint(equalTo: userAvatarImageView.trailingAnchor, constant: 46)
            .isActive = true
        postTextLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        postTextLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func makeCountPostAnchor() {
        countPost.translatesAutoresizingMaskIntoConstraints = false
        countPost.centerXAnchor.constraint(equalTo: postTextLabel.centerXAnchor).isActive = true
        countPost.bottomAnchor.constraint(equalTo: postTextLabel.topAnchor, constant: -2).isActive = true
        countPost.widthAnchor.constraint(equalToConstant: 50).isActive = true
        countPost.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func makeSubscribersTextLabelAnchor() {
        subscribersTextLabel.translatesAutoresizingMaskIntoConstraints = false
        subscribersTextLabel.centerYAnchor.constraint(equalTo: userAvatarImageView.centerYAnchor).isActive = true
        subscribersTextLabel.leadingAnchor.constraint(equalTo: postTextLabel.trailingAnchor).isActive = true
        subscribersTextLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        subscribersTextLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func makeCountSubscribersAnchor() {
        countSubscribers.translatesAutoresizingMaskIntoConstraints = false
        countSubscribers.bottomAnchor.constraint(equalTo: subscribersTextLabel.topAnchor, constant: -2).isActive = true
        countSubscribers.centerXAnchor.constraint(equalTo: subscribersTextLabel.centerXAnchor).isActive = true
        countSubscribers.widthAnchor.constraint(equalToConstant: 50).isActive = true
        countSubscribers.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func makeSubscriptionsTextLabelAnchor() {
        subscriptionsTextLabel.translatesAutoresizingMaskIntoConstraints = false
        subscriptionsTextLabel.centerYAnchor.constraint(equalTo: userAvatarImageView.centerYAnchor).isActive = true
        subscriptionsTextLabel.leadingAnchor.constraint(equalTo: subscribersTextLabel.trailingAnchor).isActive = true
        subscriptionsTextLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        subscriptionsTextLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }

    private func makeCountSubscriptionsAnchor() {
        countSubscriptions.translatesAutoresizingMaskIntoConstraints = false
        countSubscriptions.bottomAnchor.constraint(equalTo: subscriptionsTextLabel.topAnchor, constant: -2)
            .isActive = true
        countSubscriptions.centerXAnchor.constraint(equalTo: subscriptionsTextLabel.centerXAnchor).isActive = true
        countSubscriptions.widthAnchor.constraint(equalToConstant: 50).isActive = true
        countSubscriptions.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func makeLoginEmployeAnchor() {
        employeLabel.translatesAutoresizingMaskIntoConstraints = false
        employeLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 11).isActive = true
        employeLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        employeLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        employeLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func makeWebResourseAnchor() {
        webResurseButton.translatesAutoresizingMaskIntoConstraints = false
        webResurseButton.topAnchor.constraint(equalTo: employeLabel.bottomAnchor, constant: 6).isActive = true
        webResurseButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        webResurseButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        webResurseButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func makeChangeButtonAnchor() {
        changeButton.translatesAutoresizingMaskIntoConstraints = false
        changeButton.topAnchor.constraint(equalTo: webResurseButton.bottomAnchor, constant: 15).isActive = true
        changeButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        changeButton.widthAnchor.constraint(equalToConstant: 155).isActive = true
        changeButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    private func makeSharedProfileButtonAnchor() {
        sharedProfile.translatesAutoresizingMaskIntoConstraints = false
        sharedProfile.centerYAnchor.constraint(equalTo: changeButton.centerYAnchor).isActive = true
        sharedProfile.leadingAnchor.constraint(equalTo: changeButton.trailingAnchor, constant: 5).isActive = true
        sharedProfile.widthAnchor.constraint(equalToConstant: 155).isActive = true
        sharedProfile.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    private func makeAddingButtonAnchor() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.centerYAnchor.constraint(equalTo: sharedProfile.centerYAnchor).isActive = true
        addButton.leadingAnchor.constraint(equalTo: sharedProfile.trailingAnchor, constant: 5).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }
}
