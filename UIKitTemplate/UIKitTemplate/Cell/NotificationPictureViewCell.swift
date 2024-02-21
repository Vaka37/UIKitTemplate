// NotificationPictureViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для уведомлений с картинкой
final class NotificationPictureViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let identefire = "NotificationPicture"
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
        label.numberOfLines = 2
        return label
    }()

    private lazy var comentedImageView: UIImageView = {
        let image = UIImageView()

        return image
    }()

    // MARK: - Public Properties

    func configureCell(post: NotificationCellPicture) {
        avatarImageView.image = UIImage(named: post.image)
        let text = "\(post.userLogin) \(post.postDiscription) \(post.dateComent)"
        discriptionLabel.attributedText = text.setFont(UIFont.boldSystemFont(ofSize: 12), ofSubstring: post.userLogin)
        comentedImageView.image = UIImage(named: post.postPicture)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(discriptionLabel)
        contentView.addSubview(comentedImageView)
        makeAnchor()
    }

    // MARK: - Private Methods

    private func makeAnchor() {
        makeAvatarAnchor()
        makeComenteedImageAnchor()
        makeDiscriptionAnchor()
    }
}

// MARK: - Layoyt

extension NotificationPictureViewCell {
    private func makeAvatarAnchor() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func makeComenteedImageAnchor() {
        comentedImageView.translatesAutoresizingMaskIntoConstraints = false
        comentedImageView.topAnchor.constraint(equalTo: avatarImageView.topAnchor).isActive = true
        comentedImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        comentedImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        comentedImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func makeDiscriptionAnchor() {
        discriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        discriptionLabel.topAnchor.constraint(equalTo: comentedImageView.topAnchor).isActive = true
        discriptionLabel.trailingAnchor.constraint(equalTo: comentedImageView.leadingAnchor, constant: -24)
            .isActive = true
        discriptionLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 7).isActive = true
        discriptionLabel.bottomAnchor.constraint(equalTo: comentedImageView.bottomAnchor).isActive = true
    }
}
