//
//  ViewController.swift
//  quartz2DPlay
//
//  Created by Lei Zhao on 2/14/22.
//
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let frame = CGRect(x: 100, y: 200, width: 200, height: 150);
        let drawView = DrawView()
        drawView.frame = frame

        view.addSubview(drawView)
    }


}
