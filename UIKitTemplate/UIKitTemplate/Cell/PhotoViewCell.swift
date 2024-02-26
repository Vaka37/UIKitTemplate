// PhotoViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с публикацией для колекци
final class PhotoViewCell: UICollectionViewCell {
    // MARK: - Constants

    private enum Constants {
        static let identefireCell = "PhotoCell"
    }

    // MARK: - Visual Components

    private lazy var publicationImageView: UIImageView = {
        let image = UIImageView()
        image.frame = contentView.frame
        image.contentMode = .scaleAspectFill
        return image
    }()

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func setupCell(item: String) {
        backgroundColor = .red
        publicationImageView.image = UIImage(named: item)
    }

    // MARK: - Private Methods

    private func configureCell() {
        clipsToBounds = true
        contentView.addSubview(publicationImageView)
    }
}
