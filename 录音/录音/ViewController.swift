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
        return audioRecorder
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view.


    }

    @IBAction func startRecord(_ sender: Any) {
        audioRecorder?.record()
    }

    @IBAction func stopRecord(_ sender: Any) {
        audioRecorder?.stop()
    }

}
