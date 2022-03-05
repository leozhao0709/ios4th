//
//  ViewController.swift
//  LocalNotificationPlay
//
//  Created by Lei Zhao on 3/3/22.
//
//

import UIKit
import UserNotifications


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        OneNotification.requestNotification()
    }
}
