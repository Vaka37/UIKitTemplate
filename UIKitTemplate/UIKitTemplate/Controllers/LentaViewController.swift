// LentaViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран постов
final class LentaViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let messageIcon = UIImage(named: "messageIcon")
        static let logoIcon = UIImage(named: "logoImage")
        static let historyCellIdentefire = "HistoryCell"
        static let contenCellIdentefire = "ContentCell"
        static let recomendationIdentefire = "RecomentadionCell"
    }

    // MARK: - RowsType

    enum RowsType {
        /// Кейс с истрориями
        case stories
        /// Кейс с первым постом
        case firstPost
        /// Кейс с рекомендациями
        case recomend
        /// Кейс с остальными постами
        case otherPost
    }

    // MARK: - Visual Components

    private lazy var refreshControll: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(reloadTableView), for: .valueChanged)
        return refresh
    }()

    private lazy var contentTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HistoryViewCell.self, forCellReuseIdentifier: Constants.historyCellIdentefire)
        tableView.register(ContentPostViewCell.self, forCellReuseIdentifier: Constants.contenCellIdentefire)
        tableView.register(RecomendationViewCell.self, forCellReuseIdentifier: Constants.recomendationIdentefire)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()

    // MARK: - Private Properties

    private let rmLinkStorage = RMLinkStorage()
    private let rowTypes: [RowsType] = [.stories, .firstPost, .recomend, .otherPost]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        makeNavigationItem()
    }

    // MARK: - Private Methods

    private func makeNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: Constants.messageIcon,
            style: .done,
            target: self,
            action: nil
        )
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: Constants.logoIcon,
            style: .done,
            target: self,
            action: nil
        )
        makeUI()
    }

    private func makeUI() {
        view.addSubview(contentTableView)
        contentTableView.addSubview(refreshControll)
        makeConstraitTableView()
    }

    @objc private func reloadTableView() {
        contentTableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.refreshControll.endRefreshing()
        }
    }
}

// MARK: - Layoyt

extension LentaViewController {
    private func makeConstraitTableView() {
        contentTableView.translatesAutoresizingMaskIntoConstraints = false
        contentTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        contentTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

// MARK: - UITableViewDataSource

extension LentaViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        rowTypes.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let typeCell = rowTypes[indexPath.section]

        switch typeCell {
        case .stories:
            return 90
        case .firstPost:
            return 453
        case .recomend:
            return 270
        case .otherPost:
            return 453
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let typeCell = rowTypes[section]
        switch typeCell {
        case .stories, .firstPost, .recomend:
            return 1
        case .otherPost:
            return rmLinkStorage.otherPost.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let typeCell = rowTypes[indexPath.section]

        switch typeCell {
        case .stories:
            if let storieCell = tableView.dequeueReusableCell(
                withIdentifier: Constants.historyCellIdentefire,
                for: indexPath
            ) as? HistoryViewCell {
                storieCell.setupCell(stories: rmLinkStorage.stories)
            }

        case .firstPost:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.contenCellIdentefire,
                for: indexPath
            ) as? ContentPostViewCell {
                cell.setupCell(post: rmLinkStorage.posts[indexPath.row])
            }
        case .recomend:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.recomendationIdentefire,
                for: indexPath
            ) as? RecomendationViewCell {
                cell.confiUI(recomendatios: rmLinkStorage.recomend)
            }
        case .otherPost:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.contenCellIdentefire,
                for: indexPath
            ) as? ContentPostViewCell {
                cell.setupCell(post: rmLinkStorage.otherPost[indexPath.row])
            }
        }

        return UITableViewCell()
    }
}
