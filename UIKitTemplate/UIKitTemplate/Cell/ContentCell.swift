// ContentCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка с контентом
final class ContentCell: UITableViewCell {
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
    private lazy var countLike = UILabel()
    private lazy var comentOn = UILabel()
    private lazy var datePost = UILabel()

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

    private lazy var pointImage = UIImageView()
    private lazy var likeImage = UIImageView()
    private lazy var commentImage = UIImageView()
    private lazy var sendImage = UIImageView()

    private lazy var contentScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: frame.size.width * CGFloat(contentPost.count), height: 239)
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

    private lazy var pageControll: UIPageControl = {
        let pageview = UIPageControl()
        pageview.numberOfPages = contentPost.count
        pageview.currentPage = 0
        pageview.tintColor = UIColor.red
        pageview.pageIndicatorTintColor = UIColor.gray
        pageview.currentPageIndicatorTintColor = UIColor.black
        pageview.hidesForSinglePage = true
        return pageview
    }()

    // MARK: - Public Properties

    func setupCell(post: Post) {
        contentPost.append(contentsOf: post.postImagesName)
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
        countLike.text = "\(Constants.likeTitle) \(post.likeCount)"
    }

    // MARK: - Private Properties

    private lazy var contentPost: [String] = []

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
        createIconView(imageView: pointImage, image: Constants.pointImage)
        contentScrollView.addSubview(postPictureImageView)
        contentScrollView.addSubview(postPictureSecondImageView)
        createIconView(imageView: likeImage, image: Constants.likeImage)
        createIconView(imageView: commentImage, image: Constants.commentImage)
        createIconView(imageView: sendImage, image: Constants.sendImage)
        createIconView(imageView: favouritesImageView, image: Constants.favouritesImage)
        createLabel(label: countLike, color: .black, sizeFont: UIFont.boldSystemFont(ofSize: 12))
        createLabel(label: discriptionsLabel, color: .black, sizeFont: UIFont.systemFont(ofSize: 12))
        createLabel(
            label: datePost,
            title: Constants.datePostText,
            color: .systemGray,
            sizeFont: .systemFont(ofSize: 10)
        )
        contentView.addSubview(userProfileAvatarImageView)
        createLabel(
            label: comentOn,
            title: Constants.comentLabel,
            color: .systemGray,
            sizeFont: .systemFont(ofSize: 10)
        )
        contentView.addSubview(pageControll)
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

extension ContentCell {
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
        pointImage.translatesAutoresizingMaskIntoConstraints = false
        pointImage.centerYAnchor.constraint(equalTo: userPostAvatarImageView.centerYAnchor).isActive = true
        pointImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7)
            .isActive = true
        pointImage.heightAnchor.constraint(equalToConstant: 3).isActive = true
        pointImage.widthAnchor.constraint(equalToConstant: 14).isActive = true
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
        postPictureSecondImageView.leadingAnchor.constraint(equalTo: postPictureImageView.trailingAnchor).isActive = true
        postPictureSecondImageView.heightAnchor.constraint(equalToConstant: 239).isActive = true
    }

    private func makeLikeImageAnchor() {
        likeImage.translatesAutoresizingMaskIntoConstraints = false
        likeImage.topAnchor.constraint(equalTo: contentScrollView.bottomAnchor, constant: 12).isActive = true
        likeImage.leadingAnchor.constraint(equalTo: userPostAvatarImageView.leadingAnchor).isActive = true
        likeImage.heightAnchor.constraint(equalToConstant: 18).isActive = true
        likeImage.widthAnchor.constraint(equalToConstant: 18).isActive = true
    }

    private func makeCommentImageAnchor() {
        commentImage.translatesAutoresizingMaskIntoConstraints = false
        commentImage.centerYAnchor.constraint(equalTo: likeImage.centerYAnchor).isActive = true
        commentImage.leadingAnchor.constraint(equalTo: likeImage.trailingAnchor, constant: 14).isActive = true
        commentImage.heightAnchor.constraint(equalToConstant: 18).isActive = true
        commentImage.widthAnchor.constraint(equalToConstant: 18).isActive = true
    }

    private func makeSendImageAnchor() {
        sendImage.translatesAutoresizingMaskIntoConstraints = false
        sendImage.centerYAnchor.constraint(equalTo: commentImage.centerYAnchor).isActive = true
        sendImage.leadingAnchor.constraint(equalTo: commentImage.trailingAnchor, constant: 14).isActive = true
        sendImage.heightAnchor.constraint(equalToConstant: 17).isActive = true
        sendImage.widthAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func makePageControllAnchor() {
        pageControll.translatesAutoresizingMaskIntoConstraints = false
        pageControll.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pageControll.centerYAnchor.constraint(equalTo: sendImage.centerYAnchor).isActive = true
        pageControll.widthAnchor.constraint(equalToConstant: 130).isActive = true
        pageControll.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func makeFavouritesImageAnchor() {
        favouritesImageView.translatesAutoresizingMaskIntoConstraints = false
        favouritesImageView.centerYAnchor.constraint(equalTo: commentImage.centerYAnchor).isActive = true
        favouritesImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9).isActive = true
        favouritesImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        favouritesImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
    }

    private func makeCountLikeAnchor() {
        countLike.translatesAutoresizingMaskIntoConstraints = false
        countLike.topAnchor.constraint(equalTo: favouritesImageView.bottomAnchor, constant: 9).isActive = true
        countLike.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
    }

    private func makeDiscriprionsAnchor() {
        discriptionsLabel.translatesAutoresizingMaskIntoConstraints = false
        discriptionsLabel.topAnchor.constraint(equalTo: countLike.bottomAnchor, constant: 6).isActive = true
        discriptionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        discriptionsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        discriptionsLabel.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    }

    private func makeAvatarUserAnchor() {
        userProfileAvatarImageView.translatesAutoresizingMaskIntoConstraints = false
        userProfileAvatarImageView.topAnchor.constraint(equalTo: discriptionsLabel.bottomAnchor, constant: 4).isActive = true
        userProfileAvatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        userProfileAvatarImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        userProfileAvatarImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func makeComentOnAnchor() {
        comentOn.translatesAutoresizingMaskIntoConstraints = false
        comentOn.centerYAnchor.constraint(equalTo: userProfileAvatarImageView.centerYAnchor).isActive = true
        comentOn.leadingAnchor.constraint(equalTo: userProfileAvatarImageView.trailingAnchor, constant: 3).isActive = true
        comentOn.heightAnchor.constraint(equalToConstant: 15).isActive = true
        comentOn.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }

    private func makeDateLabelAnchor() {
        datePost.translatesAutoresizingMaskIntoConstraints = false
        datePost.topAnchor.constraint(equalTo: userProfileAvatarImageView.bottomAnchor, constant: 4).isActive = true
        datePost.leadingAnchor.constraint(equalTo: userProfileAvatarImageView.leadingAnchor).isActive = true
        datePost.heightAnchor.constraint(equalToConstant: 15).isActive = true
        datePost.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

// MARK: - UIScrollViewDelegate

extension ContentCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControll.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}
