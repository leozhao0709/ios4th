//
//  ViewController.swift
//  SandboxPlay
//
//  Created by Lei Zhao on 2/13/22.
//
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as NSString
        let savingPath = docPath.appendingPathComponent("/path.data")
        print(savingPath)
    }
}
