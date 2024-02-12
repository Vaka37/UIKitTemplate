// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

// стартовый экран приложения
final class PlayerViewController: UIViewController {
    // MARK: - IBAction

    @IBAction func playTrack(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(identifier: "detailVC") as? DetailViewController
        else {
            return
        }
        detailVC.createPlayer(music: "Slava Marlow - Camry 3.5")
        present(detailVC, animated: true)
    }
}
