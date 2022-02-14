//
//  ViewController.swift
//  AppStoragePlay
//
//  Created by Lei Zhao on 2/13/22.
//
//

import UIKit


class ViewController: UIViewController {

    private weak var sw: UISwitch? {
        let sw = UISwitch(frame: CGRect(x: 100, y: 100, width: 20, height: 20))
        sw.isOn = UserDefaults.standard.bool(forKey: "switch_on")
        sw.addTarget(self, action: #selector(toggleSwitch), for: .touchUpInside)
        return sw
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(sw!)
    }

    @objc private func toggleSwitch(sw: UISwitch) {
        UserDefaults.standard.set(sw.isOn, forKey: "switch_on")
    }

}
