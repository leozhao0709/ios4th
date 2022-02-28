//
//  ViewController.swift
//  identifierPlay
//
//  Created by Lei Zhao on 2/27/22.
//
//

import UIKit
import LocalAuthentication


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        let context = LAContext()
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Remind hint text") { success, error in
            if error != nil {
                print("---error---", error)
                return
            }

            if success {
                print("---success---", Thread.current)
                OperationQueue.main.addOperation {
                    print("---update UI---", Thread.current)
                }
            } else {
                print("---not success---", Thread.current)
            }
        }
    }
}
