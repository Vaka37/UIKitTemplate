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
        let lentaViewController = UINavigationController(rootViewController: LentaViewController())
        lentaViewController.tabBarItem = UITabBarItem(title: Constants.lentaTitle, image: Constants.lentaIcon, tag: 0)
        lentaViewController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        lentaViewController.view.backgroundColor = .white
        UIBarButtonItem.appearance().tintColor = UIColor.black
        return lentaViewController
    }

    private func makeNotificationViewController() -> UIViewController {
        let notificationViewController = UINavigationController(rootViewController: NotificationViewController())
        notificationViewController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        notificationViewController.tabBarItem = UITabBarItem(
            title: Constants.notificationTitle,
            image: Constants.notificationIcon,
            tag: 1
        )
        notificationViewController.view.backgroundColor = .white
        return notificationViewController
    }

    private func makeUserProfileViewController() -> UIViewController {
        let userProfileViewController = UINavigationController(rootViewController: UserProfileViewController())
        userProfileViewController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        userProfileViewController.tabBarItem = UITabBarItem(title: Constants.userTitle, image: Constants.userProfileIcon, tag: 2)
        userProfileViewController.view.backgroundColor = .white
        return userProfileViewController
    }
}
