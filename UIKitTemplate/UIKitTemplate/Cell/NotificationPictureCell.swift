// NotificationPictureCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для уведомлений с картинкой
final class NotificationPictureCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let identefire = "NotificationPicture"
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
        label.numberOfLines = 2
        return label
    }()

    private lazy var comentedImage: UIImageView = {
        let image = UIImageView()

        return image
    }()

    // MARK: - Public Properties

    func configureCell(post: NotificationCellPicture) {
        avatar.image = UIImage(named: post.image)
        let text = "\(post.userLogin) \(post.postDiscription) \(post.dateComent)"
        discription.attributedText = text.setFont(UIFont.boldSystemFont(ofSize: 12), ofSubstring: post.userLogin)
        comentedImage.image = UIImage(named: post.postPicture)
        contentView.addSubview(avatar)
        contentView.addSubview(discription)
        contentView.addSubview(comentedImage)
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

extension NotificationPictureCell {
    private func makeAvatarAnchor() {
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true
        avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func makeComenteedImageAnchor() {
        comentedImage.translatesAutoresizingMaskIntoConstraints = false
        comentedImage.topAnchor.constraint(equalTo: avatar.topAnchor).isActive = true
        comentedImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        comentedImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        comentedImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func makeDiscriptionAnchor() {
        discription.translatesAutoresizingMaskIntoConstraints = false
        discription.topAnchor.constraint(equalTo: comentedImage.topAnchor).isActive = true
        discription.trailingAnchor.constraint(equalTo: comentedImage.leadingAnchor, constant: -24).isActive = true
        discription.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 7).isActive = true
        discription.bottomAnchor.constraint(equalTo: comentedImage.bottomAnchor).isActive = true
    }
}
