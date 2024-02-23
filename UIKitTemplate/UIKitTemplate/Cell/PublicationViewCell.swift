// PublicationViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка сс коллекцией постов
final class PublicationViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let identefire = "CollectionCell"
        static let photoIdentefireCell = "PhotoCell"
    }

    // MARK: - Visual Components

    private lazy var publicationCollectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLoyaut())

    // MARK: - Public Properties

    func setupCell() {
        configureCell()
    }

    var publicationPhoto: [String] = [
        "pulication-1",
        "pulication-2",
        "pulication-3",
        "pulication-4",
        "pulication-3",
        "pulication-2",
        "pulication-4",
        "pulication-2",
        "pulication-3",
        "pulication-1"
    ]

    // MARK: - Private Methods

    private func configureCell() {
        makePublicationCollectionView()
        contentView.addSubview(publicationCollectionView)
        makeAnchor()
    }

    private func setupFlowLoyaut() -> UICollectionViewFlowLayout {
        let layot = UICollectionViewFlowLayout()
        layot.itemSize = .init(width: contentView.frame.width / 3 - 1, height: 124)
        layot.minimumLineSpacing = 1.5
        layot.minimumInteritemSpacing = 1.5
        return layot
    }

    private func makeAnchor() {
        makeCollectionViewAnchor()
    }

    private func makePublicationCollectionView() {
        publicationCollectionView.dataSource = self
        publicationCollectionView.register(
            PhotoViewCell.self,
            forCellWithReuseIdentifier: Constants.photoIdentefireCell
        )
        publicationCollectionView.showsHorizontalScrollIndicator = false
    }
}

// MARK: - Layoyt

extension PublicationViewCell {
    private func makeCollectionViewAnchor() {
        publicationCollectionView.translatesAutoresizingMaskIntoConstraints = false
        publicationCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        publicationCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        publicationCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        publicationCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}

// MARK: - UICollectionViewDataSource

extension PublicationViewCell: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.photoIdentefireCell,
            for: indexPath
        ) as? PhotoViewCell else { return UICollectionViewCell() }
        cell.setupCell(item: publicationPhoto[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        publicationPhoto.count
    }
}
