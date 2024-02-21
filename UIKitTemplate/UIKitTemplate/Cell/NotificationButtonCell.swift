// NotificationButtonCell.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Ячейка для уведомлений с кнопкой
final class NotificationButtonCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let identefire = "NotificationButton"
        static let subscribe = "Подписаться"
        static let unSubscribe = "Вы подписаны"
    }

    // MARK: - Visual Components

    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()

    private lazy var discriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()

    private lazy var subscribeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.layer.borderWidth = 0.5
        button.addTarget(self, action: #selector(selectedButton), for: .touchUpInside)
        return button
    }()

    private var isSubscribe = false

    // MARK: - Public Properties

    func configureCell(post: NotificationCellButton) {
        avatarImageView.image = UIImage(named: post.avatar)
        let text = "\(post.userLogin) \(post.postDiscription) \(post.dateComent)"
        discriptionLabel.attributedText = text.setFont(UIFont.boldSystemFont(ofSize: 12), ofSubstring: post.userLogin)
        subscribeButton.setTitle(post.isPressed ? Constants.unSubscribe : Constants.subscribe, for: .normal)
        subscribeButton.backgroundColor = post.isPressed ? .white : .systemBlue
        subscribeButton.setTitleColor(post.isPressed ? .gray : .white, for: .normal)
        subscribeButton.layer.borderColor = post.isPressed ? UIColor.gray.cgColor : UIColor.systemBlue.cgColor
        isSubscribe = post.isPressed
        contentView.addSubview(avatarImageView)
        contentView.addSubview(discriptionLabel)
        contentView.addSubview(subscribeButton)
        makeAnchor()
    }

    // MARK: - Private Methods

    private func makeAnchor() {
        makeAvatarAnchor()
        makeComenteedImageAnchor()
        makeDiscriptionAnchor()
    }

    @objc private func selectedButton() {
        subscribeButton.setTitle(isSubscribe ? Constants.unSubscribe : Constants.subscribe, for: .normal)
        subscribeButton.backgroundColor = isSubscribe ? .white : .systemBlue
        subscribeButton.setTitleColor(isSubscribe ? .gray : .white, for: .normal)
        subscribeButton.layer.borderColor = isSubscribe ? UIColor.gray.cgColor : UIColor.systemBlue.cgColor
        isSubscribe.toggle()
    }
}

// MARK: - Layoyt

extension NotificationButtonCell {
    private func makeAvatarAnchor() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func makeComenteedImageAnchor() {
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        subscribeButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true
        subscribeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        subscribeButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func makeDiscriptionAnchor() {
        discriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        discriptionLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor).isActive = true
        discriptionLabel.trailingAnchor.constraint(equalTo: subscribeButton.leadingAnchor, constant: -24)
            .isActive = true
        discriptionLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 7).isActive = true
        discriptionLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
}
