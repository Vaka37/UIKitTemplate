// ContentPostViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с контентом
final class ContentPostViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let identefire = "ContentCell"
        static let pointImage = UIImage.point
        static let likeImage = UIImage.heart
        static let commentImage = UIImage.comentIIcon
        static let sendImage = UIImage.sendIcon
        static let favouritesImage = UIImage.favouritesIcon
        static let userAvatar = UIImage.userAvatar
        static let likeTitle = "Нравится: "
        static let comentLabel = "Комментировать ..."
        static let datePostText = "10 минут назад"
    }

    // MARK: - Visual Components

    private lazy var userPostAvatarImageView: UIImageView = {
        let avatarSendImage = UIImageView()
        avatarSendImage.image = UIImage.avatar
        return avatarSendImage
    }()

    private lazy var sendPostLoginLabel = UILabel()
    private lazy var discriptionsLabel = UILabel()
    private lazy var countLikeLabel = UILabel()
    private lazy var comentOnLabel = UILabel()
    private lazy var datePostLabel = UILabel()

    private lazy var postPictureImageView: UIImageView = {
        let avatarSendImage = UIImageView()
        avatarSendImage.image = UIImage.hills
        return avatarSendImage
    }()

    private lazy var postPictureSecondImageView: UIImageView = {
        let avatarSendImage = UIImageView()
        avatarSendImage.image = UIImage.hills
        return avatarSendImage
    }()

    private lazy var pointImageView = UIImageView()
    private lazy var likeImageView = UIImageView()
    private lazy var commentImageView = UIImageView()
    private lazy var sendImageView = UIImageView()

    private lazy var contentScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: frame.size.width * CGFloat(contentPosts.count), height: 239)
        scroll.showsHorizontalScrollIndicator = false
        scroll.isPagingEnabled = true
        scroll.delegate = self
        return scroll
    }()

    private lazy var favouritesImageView: UIImageView = {
        let image = UIImageView()
        image.image = Constants.favouritesImage
        return image
    }()

    private lazy var userProfileAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.userAvatar
        return imageView
    }()

    private lazy var imagePageControll: UIPageControl = {
        let pageview = UIPageControl()
        pageview.numberOfPages = contentPosts.count
        pageview.currentPage = 0
        pageview.tintColor = UIColor.red
        pageview.pageIndicatorTintColor = UIColor.gray
        pageview.currentPageIndicatorTintColor = UIColor.black
        pageview.hidesForSinglePage = true
        return pageview
    }()

    // MARK: - Public Properties

    func setupCell(post: Post) {
        contentPosts.append(contentsOf: post.postImagesName)
        configureUI()
        userPostAvatarImageView.image = UIImage(named: post.avatarName)
        sendPostLoginLabel.text = post.login
        postPictureImageView.image = UIImage(named: post.postImagesName.first ?? "")
        postPictureSecondImageView.image = UIImage(named: post.postImagesName.last ?? "")
        let textString = "\(post.login) \(post.postDiscription)"
        discriptionsLabel.attributedText = textString.setFont(
            UIFont.boldSystemFont(ofSize: 12),
            ofSubstring: post.login
        )
        countLikeLabel.text = "\(Constants.likeTitle) \(post.likeCount)"
    }

    // MARK: - Private Properties

    private lazy var contentPosts: [String] = []

    // MARK: - Private Methods

    private func createLabel(label: UILabel, title: String = "", color: UIColor, sizeFont: UIFont) {
        label.font = sizeFont
        label.textColor = color
        label.text = title
        label.sizeToFit()
        label.numberOfLines = 0
        contentView.addSubview(label)
    }

    private func createIconView(imageView: UIImageView, image: UIImage) {
        imageView.image = image
        contentView.addSubview(imageView)
    }

    private func configureUI() {
        contentView.addSubview(contentScrollView)
        contentView.addSubview(userPostAvatarImageView)
        createLabel(label: sendPostLoginLabel, color: .black, sizeFont: UIFont.boldSystemFont(ofSize: 12))
        createIconView(imageView: pointImageView, image: Constants.pointImage)
        contentScrollView.addSubview(postPictureImageView)
        contentScrollView.addSubview(postPictureSecondImageView)
        createIconView(imageView: likeImageView, image: Constants.likeImage)
        createIconView(imageView: commentImageView, image: Constants.commentImage)
        createIconView(imageView: sendImageView, image: Constants.sendImage)
        createIconView(imageView: favouritesImageView, image: Constants.favouritesImage)
        createLabel(label: countLikeLabel, color: .black, sizeFont: UIFont.boldSystemFont(ofSize: 12))
        createLabel(label: discriptionsLabel, color: .black, sizeFont: UIFont.systemFont(ofSize: 12))
        createLabel(
            label: datePostLabel,
            title: Constants.datePostText,
            color: .systemGray,
            sizeFont: .systemFont(ofSize: 10)
        )
        contentView.addSubview(userProfileAvatarImageView)
        createLabel(
            label: comentOnLabel,
            title: Constants.comentLabel,
            color: .systemGray,
            sizeFont: .systemFont(ofSize: 10)
        )
        contentView.addSubview(imagePageControll)
        createAnchor()
    }

    private func createAnchor() {
        makeAvatarAnchor()
        makePointImageAnchor()
        makeUserLoginAnchor()
        makeContentScrollViewAnchor()
        makePostPictureAnchor()
        makePostPictureTwoAnchor()
        makeLikeImageAnchor()
        makeCommentImageAnchor()
        makeSendImageAnchor()
        makeFavouritesImageAnchor()
        makeCountLikeAnchor()
        makeDiscriprionsAnchor()
        makeAvatarUserAnchor()
        makeComentOnAnchor()
        makeDateLabelAnchor()
        makePageControllAnchor()
    }
}

// MARK: - Layoyt

extension ContentPostViewCell {
    private func makeAvatarAnchor() {
        userPostAvatarImageView.translatesAutoresizingMaskIntoConstraints = false
        userPostAvatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        userPostAvatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        userPostAvatarImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userPostAvatarImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func makePointImageAnchor() {
        sendPostLoginLabel.translatesAutoresizingMaskIntoConstraints = false
        sendPostLoginLabel.centerYAnchor.constraint(equalTo: userPostAvatarImageView.centerYAnchor).isActive = true
        sendPostLoginLabel.leadingAnchor.constraint(equalTo: userPostAvatarImageView.trailingAnchor, constant: 7)
            .isActive = true
    }

    private func makeUserLoginAnchor() {
        pointImageView.translatesAutoresizingMaskIntoConstraints = false
        pointImageView.centerYAnchor.constraint(equalTo: userPostAvatarImageView.centerYAnchor).isActive = true
        pointImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7)
            .isActive = true
        pointImageView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        pointImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
    }

    private func makeContentScrollViewAnchor() {
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        contentScrollView.topAnchor.constraint(equalTo: userPostAvatarImageView.bottomAnchor, constant: 10)
            .isActive = true
        contentScrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentScrollView.heightAnchor.constraint(equalToConstant: 239).isActive = true
    }

    private func makePostPictureAnchor() {
        postPictureImageView.translatesAutoresizingMaskIntoConstraints = false
        postPictureImageView.topAnchor.constraint(equalTo: contentScrollView.bottomAnchor, constant: 10).isActive = true
        postPictureImageView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        postPictureImageView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor).isActive = true
        postPictureImageView.heightAnchor.constraint(equalToConstant: 239).isActive = true
    }

    private func makePostPictureTwoAnchor() {
        postPictureSecondImageView.translatesAutoresizingMaskIntoConstraints = false
        postPictureSecondImageView.topAnchor.constraint(equalTo: contentScrollView.bottomAnchor, constant: 10)
            .isActive = true
        postPictureSecondImageView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        postPictureSecondImageView.leadingAnchor.constraint(equalTo: postPictureImageView.trailingAnchor)
            .isActive = true
        postPictureSecondImageView.heightAnchor.constraint(equalToConstant: 239).isActive = true
    }

    private func makeLikeImageAnchor() {
        likeImageView.translatesAutoresizingMaskIntoConstraints = false
        likeImageView.topAnchor.constraint(equalTo: contentScrollView.bottomAnchor, constant: 12).isActive = true
        likeImageView.leadingAnchor.constraint(equalTo: userPostAvatarImageView.leadingAnchor).isActive = true
        likeImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        likeImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
    }

    private func makeCommentImageAnchor() {
        commentImageView.translatesAutoresizingMaskIntoConstraints = false
        commentImageView.centerYAnchor.constraint(equalTo: likeImageView.centerYAnchor).isActive = true
        commentImageView.leadingAnchor.constraint(equalTo: likeImageView.trailingAnchor, constant: 14).isActive = true
        commentImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        commentImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
    }

    private func makeSendImageAnchor() {
        sendImageView.translatesAutoresizingMaskIntoConstraints = false
        sendImageView.centerYAnchor.constraint(equalTo: commentImageView.centerYAnchor).isActive = true
        sendImageView.leadingAnchor.constraint(equalTo: commentImageView.trailingAnchor, constant: 14).isActive = true
        sendImageView.heightAnchor.constraint(equalToConstant: 17).isActive = true
        sendImageView.widthAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func makePageControllAnchor() {
        imagePageControll.translatesAutoresizingMaskIntoConstraints = false
        imagePageControll.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imagePageControll.centerYAnchor.constraint(equalTo: sendImageView.centerYAnchor).isActive = true
        imagePageControll.widthAnchor.constraint(equalToConstant: 130).isActive = true
        imagePageControll.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func makeFavouritesImageAnchor() {
        favouritesImageView.translatesAutoresizingMaskIntoConstraints = false
        favouritesImageView.centerYAnchor.constraint(equalTo: commentImageView.centerYAnchor).isActive = true
        favouritesImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9).isActive = true
        favouritesImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        favouritesImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
    }

    private func makeCountLikeAnchor() {
        countLikeLabel.translatesAutoresizingMaskIntoConstraints = false
        countLikeLabel.topAnchor.constraint(equalTo: favouritesImageView.bottomAnchor, constant: 9).isActive = true
        countLikeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
    }

    private func makeDiscriprionsAnchor() {
        discriptionsLabel.translatesAutoresizingMaskIntoConstraints = false
        discriptionsLabel.topAnchor.constraint(equalTo: countLikeLabel.bottomAnchor, constant: 6).isActive = true
        discriptionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        discriptionsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        discriptionsLabel.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    }

    private func makeAvatarUserAnchor() {
        userProfileAvatarImageView.translatesAutoresizingMaskIntoConstraints = false
        userProfileAvatarImageView.topAnchor.constraint(equalTo: discriptionsLabel.bottomAnchor, constant: 4)
            .isActive = true
        userProfileAvatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        userProfileAvatarImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        userProfileAvatarImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func makeComentOnAnchor() {
        comentOnLabel.translatesAutoresizingMaskIntoConstraints = false
        comentOnLabel.centerYAnchor.constraint(equalTo: userProfileAvatarImageView.centerYAnchor).isActive = true
        comentOnLabel.leadingAnchor.constraint(equalTo: userProfileAvatarImageView.trailingAnchor, constant: 3)
            .isActive = true
        comentOnLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        comentOnLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }

    private func makeDateLabelAnchor() {
        datePostLabel.translatesAutoresizingMaskIntoConstraints = false
        datePostLabel.topAnchor.constraint(equalTo: userProfileAvatarImageView.bottomAnchor, constant: 4)
            .isActive = true
        datePostLabel.leadingAnchor.constraint(equalTo: userProfileAvatarImageView.leadingAnchor).isActive = true
        datePostLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        datePostLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

// MARK: - UIScrollViewDelegate

extension ContentPostViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        imagePageControll.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}
