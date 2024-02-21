// TabBarViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Tab Bar Controller
final class TabBarController: UITabBarController {
    // MARK: - Constants

    private enum Constants {
        static let lentaTitle = "Лента"
        static let notificationTitle = "Уведомления"
        static let userTitle = "Профиль"
        static let lentaIcon = UIImage(named: "homePage")
        static let notificationIcon = UIImage(named: "notification")
        static let userProfileIcon = UIImage(named: "userProfile")
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
    }

    // MARK: - Private Methods

    private func setUpTabBar() {
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .black
        viewControllers = [
            makeLentaViewController(),
            makeNotificationViewController(),
            makeUserProfileViewController()
        ]
    }

    private func makeLentaViewController() -> UIViewController {
        let viewController = UINavigationController(rootViewController: LentaViewController())
        viewController.tabBarItem = UITabBarItem(title: Constants.lentaTitle, image: Constants.lentaIcon, tag: 0)
        viewController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        viewController.view.backgroundColor = .white
        UIBarButtonItem.appearance().tintColor = UIColor.black
        return viewController
    }

    private func makeNotificationViewController() -> UIViewController {
        let viewController = UINavigationController(rootViewController: NotificationViewController())
        viewController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        viewController.tabBarItem = UITabBarItem(
            title: Constants.notificationTitle,
            image: Constants.notificationIcon,
            tag: 1
        )
        viewController.view.backgroundColor = .white
        return viewController
    }

    private func makeUserProfileViewController() -> UIViewController {
        let viewController = UINavigationController(rootViewController: UserProfileViewController())
        viewController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        viewController.tabBarItem = UITabBarItem(title: Constants.userTitle, image: Constants.userProfileIcon, tag: 2)
        viewController.view.backgroundColor = .white
        return viewController
    }
}
