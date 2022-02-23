//
//  ViewController.swift
//  图片截屏
//
//  Created by Lei Zhao on 2/16/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    private var startPanPoint: CGPoint = .zero

    private weak var _coverView: UIView?
    private weak var coverView: UIView? {
        if _coverView == nil {
            let view1 = UIView()
            view1.backgroundColor = UIColor.black
            view1.alpha = 0.7
            view.addSubview(view1)
            _coverView = view1
        }
        return _coverView
    }

//    private weak var coverView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.isUserInteractionEnabled = true

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(selectArea))
        imageView.addGestureRecognizer(panGesture)
    }

//    private func createCoverView() {
//        if coverView != nil {
//            return
//        }
//
//        let view1 = UIView()
//        view1.backgroundColor = UIColor.black
//        view1.alpha = 0.7
//        view.addSubview(view1)
//        coverView = view1
//    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        startPanPoint = touches.first!.location(in: imageView)
        print("...touch...", touches.first?.location(in: imageView))
        print(coverView)
    }

    @objc private func selectArea(panGesture: UIPanGestureRecognizer) {
//        if panGesture.state == .began {
//            startPanPoint = panGesture.location(in: view)
//            print(startPanPoint)
//        }
        if panGesture.state == .changed {
            let curPoint = panGesture.location(in: imageView)

            let x: CGFloat = startPanPoint.x < curPoint.x ? startPanPoint.x:curPoint.x
            let y: CGFloat = startPanPoint.y < curPoint.y ? startPanPoint.y:curPoint.y
            let width: CGFloat = abs(curPoint.x - startPanPoint.x)
            let height: CGFloat = abs(curPoint.y - startPanPoint.y)

//            createCoverView()
            coverView!.frame = CGRect(x: x, y: y, width: width, height: height)
        }
        if panGesture.state == .ended {
            UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0)

            let clipPath = UIBezierPath(rect: (coverView?.frame)!)
            clipPath.addClip()

            coverView?.backgroundColor = .clear

            view.layer.render(in: UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            imageView.image = image
            coverView!.removeFromSuperview()
        }
    }
}

