//
//  ViewController.swift
//  ModalPlay
//
//  Created by Lei Zhao on 2/13/22.
//
//

import UIKit


class ViewController: UIViewController {

    private weak var btn: UIButton? {
        let btn = UIButton(type: .roundedRect)
        btn.setTitle("showModal", for: .normal)
        btn.sizeToFit()
        btn.addTarget(self, action: #selector(showModal), for: .touchUpInside)
        btn.center = view.center
        return btn
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(btn!)
    }

    @objc private func showModal() {
        let testViewCtrl = TestViewController()
        present(testViewCtrl, animated: true)
    }
}
