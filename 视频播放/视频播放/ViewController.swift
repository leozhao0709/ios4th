//
//  ViewController.swift
//  视频播放
//
//  Created by Lei Zhao on 3/10/22.
//
//

import UIKit
import AVKit


class ViewController: UIViewController {

    // need a strong reference here
    private var avPlayerCtrl: AVPlayerViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        let avPlayerCtrl = AVPlayerViewController()
        let url = URL(fileReferenceLiteralResourceName: "./video/xiaohuangren.mp4");
        let playerItem = AVPlayerItem(url: url)

        let player = AVPlayer(playerItem: playerItem)
        avPlayerCtrl.player = player

//        // if we want to customize control, then we should make following to false
//        avPlayerCtrl.showsPlaybackControls = false

        self.avPlayerCtrl = avPlayerCtrl

//        // modal show video with full screen
//        present(avPlayerCtrl, animated: true)

        // customize view
        avPlayerCtrl.view.frame = CGRect(x: 40, y: 200, width: 300, height: 400)
        view.addSubview(avPlayerCtrl.view)
    }
}
