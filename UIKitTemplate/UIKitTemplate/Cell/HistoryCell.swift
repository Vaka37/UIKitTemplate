// HistoryCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка для создания историий
final class HistoryCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let historyCell = "HistoryCell"
        static let youHistoryTltle = "Ваша история"
        static let avatarUser = UIImage.avatar
    }

    // MARK: - Visual Components

    private lazy var historyScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: frame.size.width * 2, height: frame.size.height)
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()

    // MARK: - Public Properties

    func setupCell(stories: [Stories]) {
        addSubview(historyScrollView)
        createStories(post: stories)
        makeHistoryScrollViewAnchor()
    }

    // MARK: - Private Properties

    private func createStories(post: Stories, constant: CGFloat) {
        let button = UIButton()
        button.setImage(UIImage(named: post.avatarName), for: .normal)
        let title = UILabel()
        title.textColor = .gray
        title.font = UIFont.systemFont(ofSize: 8)
        title.sizeToFit()
        title.text = post.login
        historyScrollView.addSubview(button)
        historyScrollView.addSubview(title)
        makeAvatarAnchor(view: button, constant: constant)
        makeYouHistoryLabelAnchor(view: title, from: button)
    }

    private func createStories(post: [Stories]) {
        var count: CGFloat = 12
        for item in post {
            createStories(post: item, constant: count)
            count += 73
        }
    }
}

// MARK: - Layoyt

extension HistoryCell {
    private func makeYouHistoryLabelAnchor(view: UIView, from: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3).isActive = true
        view.centerXAnchor.constraint(equalTo: from.centerXAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    private func makeHistoryScrollViewAnchor() {
        historyScrollView.translatesAutoresizingMaskIntoConstraints = false
        historyScrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        historyScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        historyScrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        historyScrollView.widthAnchor.constraint(equalToConstant: 600).isActive = true
    }

    private func makeAvatarAnchor(view: UIView, constant: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: historyScrollView.leadingAnchor, constant: constant).isActive = true
        view.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
