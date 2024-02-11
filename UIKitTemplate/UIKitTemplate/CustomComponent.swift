// CustomComponent.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Кастомная вьюшка с леблом текст филдом и сепаратором
final class CustomComponents: UIView {
    var titleLabel = UILabel()
    var textField = UITextField()
    private var lineView = UIView()

    private func createLabel() {
        titleLabel.frame = CGRect(x: 0, y: 29, width: 175, height: 19)
        titleLabel.singleLabel()
        addSubview(titleLabel)
    }

    private func createTextFields() {
        textField.borderStyle = .none
        textField.frame = CGRect(x: 0, y: 59, width: 175, height: 17)
        addSubview(textField)
    }

    private func createLineViwe() {
        lineView.frame = CGRect(x: 0, y: 90, width: 335, height: 1)
        lineView.backgroundColor = .gray
        addSubview(lineView)
    }

    init(
        titleLabel: UILabel = UILabel(),
        textField: UITextField = UITextField(),
        lineView: UIView = UIView()
    ) {
        super.init(frame: CGRect())
        self.titleLabel = titleLabel
        self.textField = textField
        self.lineView = lineView
        createLabel()
        createTextFields()
        createLineViwe()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/// Кастомная ячейка
final class CellUIView: UIView {
    var nameLabel = UILabel()
    var dateLabel = UILabel()
    var image = UIImageView()
    var bickwitImage = UIImageView()
    var todayBD = false

    init(
        nameLabel: UILabel = UILabel(),
        dateLabel: UILabel = UILabel(),
        image: UIImageView = UIImageView(),
        bickwitImage: UIImageView = UIImageView(),
        todayBD: Bool = Bool()
    ) {
        super.init(frame: CGRect())
        self.nameLabel = nameLabel
        self.dateLabel = dateLabel
        self.image = image
        self.bickwitImage = bickwitImage
        self.todayBD = todayBD
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createView() {
        nameLabel.singleLabel()
        nameLabel.frame = CGRect(x: 91, y: 25, width: 180, height: 20)
        dateLabel.frame = CGRect(x: 91, y: 53, width: 180, height: 20)
        dateLabel.font = UIFont.systemFont(ofSize: 14)
        image.frame = CGRect(x: 8, y: 11, width: 75, height: 75)
        bickwitImage.frame = CGRect(x: 279, y: 25, width: 44, height: 44)
        if todayBD {
            bickwitImage.image = UIImage(named: "bisckwit")
        }
        layer.cornerRadius = 12
        addSubview(nameLabel)
        addSubview(dateLabel)
        addSubview(image)
        addSubview(bickwitImage)
    }
}
