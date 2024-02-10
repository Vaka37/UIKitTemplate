// ExitViewController.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Завершающий экран приложения
final class ExitViewController: UIViewController {
    //MARK: - publick propeties
    var login = ""
    // MARK: - @IBOutlet

    @IBOutlet var thanksLabel: UILabel!

    // MARK: - Life Cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        thanksLabel.text = (thanksLabel.text ?? "") + login
    }
}
