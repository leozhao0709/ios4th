//
//  ViewController.swift
//  音效
//
//  Created by Lei Zhao on 3/9/22.
//
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        var soundID: SystemSoundID = 0
        guard let url = Bundle.main.url(forResource: "./buyao.wav", withExtension: nil)  else {
            print("---return---")
            return
        }
        let status = AudioServicesCreateSystemSoundID(url as CFURL, &soundID)
        if status != kAudioServicesNoError {
            print("Error loading sound effect")
            return
        }

        AudioServicesPlaySystemSound(soundID)
//        AudioServicesPlayAlertSound(soundID) // 带震动
    }
}
