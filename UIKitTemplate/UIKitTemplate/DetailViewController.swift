// DetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import Foundation
import UIKit
///вью с детальной информацией о треке
final class DetailViewController: UIViewController {
    //MARK: - @IBOutlet
    ///кнопка стоп/ плей
    @IBOutlet var playButton: UIButton!
    ///трек сллайдер
    @IBOutlet var durationSlider: UISlider!
    ///сслайдер ггромкости
    @IBOutlet var volumeSlider: UISlider! {
        didSet {
            volumeSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
        }
    }
//MARK: - private propites
    ///наш плеер
    private var player = AVAudioPlayer()
//MARK: - Lifi cicly
    override func viewDidLoad() {
        super.viewDidLoad()
        createVisualComponents()
    }
    //MARK: - publick propites
///создание плеера
    func createPlayer(music: String) {
        do {
            if let audioPath = Bundle.main.path(forResource: music, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
        } catch {
            print("Error")
        }
        player.play()
    }
//MARK: - private propites
    private func createVisualComponents() {
        createSlider()
        createSliderVolume()
        playButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
    }

   private func createSlider() {
        durationSlider.minimumValue = 0.0
        durationSlider.maximumValue = 100.0
        durationSlider.maximumValue = Float(player.duration)
        durationSlider.value = 0.0
        Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTime),
            userInfo: nil,
            repeats: true
        )
        durationSlider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
    }

    @objc func updateTime(_ timer: Timer) {
        durationSlider.value = Float(player.currentTime)
    }

    @objc func changeSlider(sender: UISlider) {
        if sender == durationSlider {
            player.currentTime = TimeInterval(sender.value)
        }
    }
///создание слайдера громкости
    private func createSliderVolume() {
        volumeSlider.value = 100
        volumeSlider.addTarget(self, action: #selector(sliderVolumeMethod), for: .valueChanged)
    }

    @objc func sliderVolumeMethod() {
        player.volume = volumeSlider.value
    }
//MARK: - IBAction
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func playPausePlayer(_ sender: Any) {
        if player.isPlaying {
            player.pause()
            playButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
        } else {
            playButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
            player.play()
        }
    }

    @IBAction func backwordTrack(_ sender: Any) {
        createPlayer(music: "Slava Marlow - Camry 3.5")
    }

    @IBAction func forwardTrack(_ sender: Any) {
        createPlayer(music: "АлСми - Мадам")
    }
}
