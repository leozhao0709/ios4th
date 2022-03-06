//
//  ViewController.swift
//  LocalNotificationPlay
//
//  Created by Lei Zhao on 3/4/22.
//
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        let first = OneNotification.shared
        let two = OneNotification.shared
        print(first == two)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("---start request notification---")
        OneNotification.requestNotification()
    }
}
