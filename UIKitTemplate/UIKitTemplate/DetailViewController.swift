// DetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// контроллер с детальной информациией
final class DetailViewController: UIViewController {
    // MARK: - Visual Components

    private let todayLabel = UILabel()
    private let nextLabel = UILabel()
    private var nextMonth = UILabel()
    private var futureBD = UILabel()
    private var cellToday = CellUIView()
    private var cellNextDay = CellUIView()
    private var cellNextMonth = CellUIView()
    private var cellNextMonthTwo = CellUIView()
    private var modelUser: Model?

    // MARK: - Life cicly

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUiComponents()
    }

    // MARK: - private Methods

    /// кладем компоненты на вью
    private func setUpUiComponents() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .done,
            target: self,
            action: #selector(pushScreenController)
        )
        view.backgroundColor = .white
        title = "Birthday Reminder"
        createLabel(label: todayLabel, title: "Today", lineY: 103)
        createLabel(label: nextLabel, title: "Next week", lineY: 244)
        createLabel(label: nextMonth, title: "Next month", lineY: 385)
        createLabel(label: futureBD, title: "June 2024", lineY: 526)
        createCell(
            cell: cellToday,
            lineY: 131,
            isToday: true,
            name: "Helena Link",
            dateBD: "10.03 - turns 25!",
            image: "avatarOne"
        )
        createCell(cell: cellNextDay, lineY: 272, name: "Verona Tusk", dateBD: "20.03 - turns 39", image: "avatarTwo")
        createCell(
            cell: cellNextMonth,
            lineY: 413,
            name: "Alex Smith",
            dateBD: "21.04 - turns 51",
            image: "avatarThree"
        )
        createCell(
            cell: cellNextMonthTwo,
            lineY: 554,
            name: "Tom Johnson",
            dateBD: "05.06 - turns 18",
            image: "avatarFour"
        )
    }

    /// создаем ячейку
    private func createCell(
        cell: CellUIView,
        lineY: Int,
        isToday: Bool = false,
        name: String,
        dateBD: String,
        image: String
    ) {
        cell.frame = CGRect(x: 16, y: lineY, width: 335, height: 93)
        cell.todayBD = isToday
        cell.nameLabel.text = name
        cell.dateLabel.text = dateBD
        cell.image.image = UIImage(named: image)
        if isToday {
            cell.backgroundColor = #colorLiteral(red: 0.9904959798, green: 0.9307106137, blue: 0.9668534398, alpha: 1)
        } else {
            cell.backgroundColor = #colorLiteral(red: 0.7144944668, green: 0.6704457402, blue: 0.8106449246, alpha: 1)
        }
        cell.createView()

        view.addSubview(cell)
    }

    private func createLabel(label: UILabel, title: String, lineY: Int) {
        label.frame = CGRect(x: 16, y: lineY, width: 180, height: 20)
        label.text = title
        label.singleLabel()
        view.addSubview(label)
    }

    /// Созддаем новую ячейку
    private func createNewCell(model: Model) {
        let cell = CellUIView()
        cell.nameLabel.text = model.name
        cell.dateLabel.text = model.date?.formatted(date: .numeric, time: .omitted)
        cell.frame = CGRect(x: 16, y: (view.subviews.last?.center.y ?? 0) + 70, width: 335, height: 93)
        cell.image.image = UIImage(named: "defautIcon")
        let date = Int((((model.date?.timeIntervalSince1970 ?? 0) - Date().timeIntervalSince1970) / 86400).rounded(.up))
        if date == 0 {
            cell.backgroundColor = #colorLiteral(red: 0.9904959798, green: 0.9307106137, blue: 0.9668534398, alpha: 1)
            cell.todayBD = true
        } else {
            cell.backgroundColor = #colorLiteral(red: 0.7144944668, green: 0.6704457402, blue: 0.8106449246, alpha: 1)
        }
        cell.createView()
        view.addSubview(cell)
    }

    @objc private func pushScreenController() {
        let addViewController = AddindViewController()
        addViewController.closure = { model in
            self.modelUser = model
            self.createNewCell(model: model)
        }
        present(addViewController, animated: true)
    }
}

extension UILabel {
    func singleLabel() {
        textColor = .black
        font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        numberOfLines = 0
    }
}
