// DetailStoriesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с для просмотра сторис
final class DetailStoriesViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let image = UIImage(named: "detailStories")
    }

    // MARK: - Visual Components

    private var progressView: UIProgressView = {
        let bar = UIProgressView()
        bar.progressViewStyle = .bar
        bar.trackTintColor = .gray
        bar.progressTintColor = .white
        bar.setProgress(0.0, animated: false)
        return bar
    }()

    private lazy var mainPictureImageView: UIImageView = {
        let image = UIImageView()
        image.image = Constants.image
        image.frame = view.frame
        return image
    }()

    let storiesImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()

    // MARK: - Private Properties

    private var progressTimer = Timer()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    private func makeProgressTimer() {
        progressTimer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(staringTimer),
            userInfo: nil,
            repeats: true
        )
    }

    private func configureUI() {
        view.addSubview(mainPictureImageView)
        view.addSubview(storiesImageView)
        view.addSubview(progressView)
        makeProgressTimer()
        makeAnchor()
    }

    private func makeAnchor() {
        makeStoriesAvatarAnchor()
        makeProgresViewrAnchor()
    }

    @objc func staringTimer() {
        if progressView.progress != 1.0 {
            progressView.progress += 0.1
        } else if progressView.progress == 1 {
            progressTimer.invalidate()
            dismiss(animated: true)
        }
    }
}

// MARK: - Layoyt

extension DetailStoriesViewController {
    private func makeStoriesAvatarAnchor() {
        storiesImageView.translatesAutoresizingMaskIntoConstraints = false
        storiesImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23).isActive = true
        storiesImageView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        storiesImageView.widthAnchor.constraint(equalToConstant: 27).isActive = true
        storiesImageView.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    private func makeProgresViewrAnchor() {
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
        progressView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
