//
//  ViewController.swift
//  录音
//
//  Created by Lei Zhao on 3/9/22.
//
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    private lazy var audioRecorder: AVAudioRecorder? = {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/record.m4a"
        let url = URL(fileURLWithPath: path)
        let settings: [String: Any] = [
            AVSampleRateKey: 8000,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.low.rawValue,
            AVFormatIDKey: kAudioFormatMPEG4AAC
        ]
        audioRecorder = try? AVAudioRecorder(url: url, settings: settings)

        // 监控声波(开启声波检测)
        audioRecorder?.isMeteringEnabled = true
        let session = AVAudioSession.sharedInstance()
        try? session.setCategory(.record)
        return audioRecorder
    }()

    private lazy var displayLink: CADisplayLink = {
        let displayLink = CADisplayLink(target: self, selector: #selector(updateMeter))
        displayLink.add(to: .main, forMode: .common)
        return displayLink
    }()

    @objc private func updateMeter() {
        audioRecorder?.updateMeters()

        let power = audioRecorder?.averagePower(forChannel: 0) // power range: -160 ~ 0. 0 means high power.
        print("---power---\(power)")
    }


    @IBAction func startRecord(_ sender: Any) {
        audioRecorder?.record()
        displayLink.isPaused = false
    }

    @IBAction func stopRecord(_ sender: Any) {
        audioRecorder?.stop()
        displayLink.isPaused = true
    }

}
