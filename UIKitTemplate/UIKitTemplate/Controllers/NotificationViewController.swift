// NotificationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер с уведомлениями
final class NotificationViewController: UIViewController {
    // MARK: - RowsType

    enum RowsType {
        case notificationPicture
        case notificationButton
    }

    // MARK: - Constants

    private enum Constants {
        static let notificationPictureCellIdentefire = "NotificationPicture"
        static let notificationButtonCellIdentefire = "NotificationButton"
        static let headeSectionOne = "Сегодня"
        static let headerSectionTwo = "На этой неделе"
    }

    // MARK: - Visual Components

    private lazy var notificationTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            NotificationPictureCell.self,
            forCellReuseIdentifier: Constants.notificationPictureCellIdentefire
        )
        tableView.register(
            NotificationButtonCell.self,
            forCellReuseIdentifier: Constants.notificationButtonCellIdentefire
        )
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    // MARK: - Private Properties

    private let typeRows: [RowsType] = [.notificationPicture, .notificationButton]

    private var rMLinkStorage = RMLinkStorage()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    private func configNavigation() {
        title = "Уведомления"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func configureUI() {
        configNavigation()
        view.addSubview(notificationTableView)
        makeConstraitTableView()
    }
}

// MARK: - Layoyt

extension NotificationViewController {
    private func makeConstraitTableView() {
        notificationTableView.translatesAutoresizingMaskIntoConstraints = false
        notificationTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        notificationTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        notificationTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        notificationTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

// MARK: - UITableViewDelegate

extension NotificationViewController: UITableViewDelegate {}

// MARK: - UITableViewDataSource

extension NotificationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        typeRows.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let typeRow = typeRows[section]
        switch typeRow {
        case .notificationPicture:
            return rMLinkStorage.cellPicture.count
        case .notificationButton:
            return rMLinkStorage.cellButton.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let typeCell = typeRows[indexPath.section]
        switch typeCell {
        case .notificationPicture:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.notificationPictureCellIdentefire,
                for: indexPath
            ) as? NotificationPictureCell {
                cell.configureCell(post: rMLinkStorage.cellPicture[indexPath.row])
            }
        case .notificationButton:
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.notificationButtonCellIdentefire,
                for: indexPath
            ) as? NotificationButtonCell {
                cell.configureCell(post: rMLinkStorage.cellButton[indexPath.row])
            }
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        let label = UILabel()
        label.frame = CGRect(x: 12, y: 0, width: headerView.frame.width - 10, height: headerView.frame.height - 10)
        label.text = section == 0 ? Constants.headeSectionOne : Constants.headerSectionTwo
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .black
        headerView.addSubview(label)
        return headerView
    }
}
