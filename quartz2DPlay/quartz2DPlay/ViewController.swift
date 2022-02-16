//
//  ViewController.swift
//  quartz2DPlay
//
//  Created by Lei Zhao on 2/14/22.
//
//

import UIKit


class ViewController: UIViewController {

    private var imageView: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setImageView()
//        view.addSubview(imageView!)
//        view.backgroundColor = .systemCyan
//        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0)
//        let ctx = UIGraphicsGetCurrentContext()
//        if let ctx = ctx {
//            view.layer.render(in: ctx)
//        }
//
//        let screenShot = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        if let screenShot = screenShot {
//            UIImageWriteToSavedPhotosAlbum(screenShot, self, #selector(saveComplete), nil)
//        }
    }

    private func setImageView() {
        let imageView = UIImageView()
        imageView.center = view.center
        let width: CGFloat = 300
        let height: CGFloat = 200
        imageView.bounds.size = CGSize(width: width, height: height)
        imageView.backgroundColor = .systemCyan

//        let img = UIImage(named: "me")?.circleImage(withBorderWidth: 5, andBorderColor: .systemPink)
        let img = UIImage(named: "me")?.circleImage()
        imageView.image = img
        imageView.contentMode = .scaleAspectFit

//        // save image to sandbox
//        if let data = img?.pngData() {
//            let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first! + "xx.png"
//            let url = URL(fileURLWithPath: path)
//            try? data.write(to: url)
//        }

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true

        view.addSubview(imageView)
        self.imageView = imageView
    }

    @objc private func saveComplete(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafeRawPointer) {
        var message = ""
        if error == nil {
            message = "save successfully!!!"
        } else {
            message = "save failed!"
        }

        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)

        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }

    @objc
    private func tap(tapGesture: UIGestureRecognizer) {
        print(imageView)
        let tapPoint = tapGesture.location(in: imageView!)
        print(tapPoint)
        if tapPoint.x < imageView!.bounds.width*0.5 {
            print("tap left")
        } else {
            print("tap right")
        }
    }
}
