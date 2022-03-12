//
//  ViewController.swift
//  录制视频
//
//  Created by Lei Zhao on 3/11/22.
//

import UIKit
import UniformTypeIdentifiers
import Photos

class ViewController: UIViewController {

    @IBAction func startRecord(_ sender: Any) {
        recordVideo()
    }

    private func takePhoto() {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            return
        }

        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.mediaTypes = [UTType.image.identifier]

        picker.delegate = self

        present(picker, animated: true)
    }

    private func recordVideo() {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            return
        }

        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.mediaTypes = [UTType.movie.identifier]
        picker.cameraCaptureMode = .video
        picker.videoQuality = .typeHigh

        picker.delegate = self

        present(picker, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let mediaType = info[.mediaType] as? String else {
            return
        }

        if mediaType == UTType.image.identifier {
            guard let image = info[.originalImage] as? UIImage else{
                return
            }
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: image)
            }, completionHandler: { success, error in
                guard error == nil, success != false else { return }
                print("save successfully...")
            })
        }

        if mediaType == UTType.movie.identifier {
            guard let mediaUrl = info[.mediaURL] as? URL else {
                return
            }

            // save to video library
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: mediaUrl)
            }, completionHandler: { success, error in
                guard error == nil, success != false else { return }

                print("save successfully...")
            })
        }

        picker.dismiss(animated: true)
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
