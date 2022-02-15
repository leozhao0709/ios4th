//
//  ViewController.swift
//  quartz2DPlay
//
//  Created by Lei Zhao on 2/14/22.
//
//

import UIKit


class ViewController: UIViewController {

    private weak var imageView: UIImageView? {
        let imageView = UIImageView()
        imageView.center = view.center
        let width: CGFloat = 300
        let height: CGFloat = 200
        imageView.bounds.size = CGSize(width: width, height: height)

//        imageView.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
//        imageView.backgroundColor = .systemTeal
        imageView.image = UIImage(named: "me")?.circleImage()
//        imageView.image = UIImage(named: "me")
        return imageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.


        view.addSubview(imageView!)
    }


}
