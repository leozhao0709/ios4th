//
//  ViewController.swift
//  视频截图
//
//  Created by Lei Zhao on 3/11/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        let url = URL(fileReferenceLiteralResourceName: "./video/xiaohuangren.mp4")
        let asset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)

        let time = CMTime(seconds: 65, preferredTimescale: 1)
        let value = NSValue(time: time)
        imageGenerator.generateCGImagesAsynchronously(forTimes: [value]) { time, image, time2, result, error in
            guard let image = image, error == nil else { return }

            OperationQueue.main.addOperation {
                self.imageView.image = UIImage(cgImage: image)
            }
        }
    }
}

