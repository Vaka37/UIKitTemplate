// UserProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с информацией о пользователе
final class UserProfileViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let userCellidentefire = "NotificationButton"
        static let historyCellIdentefire = "HistoryCell"
        static let collectionViewIdentefire = "CollectionCell"
    }

    // MARK: - RowsType

    /// Энам с видами секций
    enum RowsType {
        /// Ячейка с пользователем
        case user
        /// Ячейка с историями
        case stories
        /// Ячейка с публикациями
        case publication
    }

    // MARK: - Visual Components

    private lazy var contentTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UserViewCell.self, forCellReuseIdentifier: Constants.userCellidentefire)
        tableView.register(HistoryViewCell.self, forCellReuseIdentifier: Constants.historyCellIdentefire)
        tableView.register(PublicationViewCell.self, forCellReuseIdentifier: Constants.collectionViewIdentefire)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()

    // MARK: - Private Properties

    private let rowTypes: [RowsType] = [.user, .stories, .publication]
    private let rmLinkStorage = RMLinkStorage()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Public Methods

    func openDetaiViewController(image: UIImage?) {
        let detailStoriesViewController = DetailStoriesViewController()
        detailStoriesViewController.storiesImageView.image = image
        present(detailStoriesViewController, animated: true)
    }

    func openWebSite(url: String?) {
        let web = WebViewController()
        web.url = url ?? ""
        present(web, animated: true)
    }

    // MARK: - Private Methods

    private func configureUI() {
        configureNavigationBar()
        view.addSubview(contentTableView)
        makeAnchor()
    }

    private func configureNavigationBar() {
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(
                image: .llockIcon,
                style: .done,
                target: self,
                action: nil
            ),
            UIBarButtonItem(
                image: .userLogo,
                style: .done,
                target: self,
                action: nil
            )
        ]
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: .listIcon,
                style: .done,
                target: self,
                action: nil
            ),
            UIBarButtonItem(
                image: .calendarPlus,
                style: .done,
                target: self,
                action: nil
            )
        ]
    }

    private func makeAnchor() {
        view.addSubview(contentTableView)
        makeConstraitTableView()
    }
}

// MARK: - Layoyt

extension UserProfileViewController {
    private func makeConstraitTableView() {
        contentTableView.translatesAutoresizingMaskIntoConstraints = false
        contentTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        contentTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

// MARK: - UITableViewDataSource

extension UserProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        rowTypes.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let typeCell = rowTypes[indexPath.section]
        switch typeCell {
        case .user:
            return 230
        case .stories:
            return 90
        case .publication:
            return 500
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let typeCell = rowTypes[indexPath.section]

        switch typeCell {
        case .user:
            if let userCell = tableView.dequeueReusableCell(
                withIdentifier: Constants.userCellidentefire,
                for: indexPath
            ) as? UserViewCell {
                userCell.configureCell(user: rmLinkStorage.user)
                userCell.transmisionUrl = openWebSite
            }

        case .stories:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.historyCellIdentefire,
                for: indexPath
            ) as? HistoryViewCell {
                cell.setupCell(stories: rmLinkStorage.userStories)
                cell.transmisionImage = openDetaiViewController
            }
        case .publication:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.collectionViewIdentefire,
                for: indexPath
            ) as? PublicationViewCell {
                cell.setupCell(items: rmLinkStorage.publicationPhoto)
            }
        }
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension UserProfileViewController: UITableViewDelegate {}
