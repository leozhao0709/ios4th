//
//  ViewController.swift
//  压缩视频
//
//  Created by Lei Zhao on 3/11/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        let url = URL(fileReferenceLiteralResourceName: "./video/xiaohuangren.mp4")
        let asset = AVAsset(url: url)

        let session = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetLowQuality)
        let outputPath = NSTemporaryDirectory() + "/1234.mp4"
        session?.outputURL = URL(fileURLWithPath: outputPath)
        session?.outputFileType = .mp4

        session?.exportAsynchronously {
            print("---export successfully---")
        }
    }
}

