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

    private lazy var avatar: UIImageView = {
        let image = UIImageView()
        return image
    }()

    private lazy var discription: UILabel = {
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
        avatar.image = UIImage(named: post.avatar)
        let text = "\(post.userLogin) \(post.postDiscription) \(post.dateComent)"
        discription.attributedText = text.setFont(UIFont.boldSystemFont(ofSize: 12), ofSubstring: post.userLogin)
        subscribeButton.setTitle(post.isPressed ? Constants.unSubscribe : Constants.subscribe, for: .normal)
        subscribeButton.backgroundColor = post.isPressed ? .white : .systemBlue
        subscribeButton.setTitleColor(post.isPressed ? .gray : .white, for: .normal)
        subscribeButton.layer.borderColor = post.isPressed ? UIColor.gray.cgColor : UIColor.systemBlue.cgColor
        isSubscribe = post.isPressed
        contentView.addSubview(avatar)
        contentView.addSubview(discription)
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
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true
        avatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func makeComenteedImageAnchor() {
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        subscribeButton.centerYAnchor.constraint(equalTo: avatar.centerYAnchor).isActive = true
        subscribeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        subscribeButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func makeDiscriptionAnchor() {
        discription.translatesAutoresizingMaskIntoConstraints = false
        discription.topAnchor.constraint(equalTo: avatar.topAnchor).isActive = true
        discription.trailingAnchor.constraint(equalTo: subscribeButton.leadingAnchor, constant: -24).isActive = true
        discription.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 7).isActive = true
        discription.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
}
