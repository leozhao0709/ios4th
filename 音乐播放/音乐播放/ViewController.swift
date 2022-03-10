//
//  ViewController.swift
//  音乐播放
//
//  Created by Lei Zhao on 3/9/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    private lazy var audioPlayer: AVAudioPlayer? = {
        let url = Bundle.main.url(forResource: "music/1201111234.mp3", withExtension: nil)
        guard let url = url else { return nil }
        let player = try? AVAudioPlayer(contentsOf: url)
        return player
    }()

    private lazy var avPlayer: AVPlayer? = {
//        let url = URL(string: "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3")
//        guard let url = url else { return nil }
        let url = URL(fileReferenceLiteralResourceName: "music/1201111234.mp3")
        let playerItem = AVPlayerItem(url: url)

        let avPlayer = AVPlayer(playerItem: playerItem)
        return avPlayer
    }()

    @IBAction func play(_ sender: Any) {
//        audioPlayer?.play()
        avPlayer?.play()
    }
    
    @IBAction func pause(_ sender: Any) {
//        audioPlayer?.pause()
//        avPlayer?.pause()

        nextSong()
    }

    private func nextSong() {
        let url = URL(string: "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3")
        guard let url = url else { return }
        let playerItem = AVPlayerItem(url: url)
        avPlayer?.replaceCurrentItem(with: playerItem)
    }

    @IBAction func stop(_ sender: Any) {
//        audioPlayer?.stop()
//        audioPlayer?.currentTime = 0
        avPlayer?.replaceCurrentItem(with: nil)
        avPlayer?.seek(to: CMTime(seconds: 0, preferredTimescale: 1))
    }
}

