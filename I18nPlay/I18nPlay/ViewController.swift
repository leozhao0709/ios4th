//
//  ViewController.swift
//  I18nPlay
//
//  Created by Lei Zhao on 4/23/22.
//
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var clickMeBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        clickMeBtn.setTitle(NSLocalizedString("click_me", tableName: "lan_en", comment: ""), for: .normal)
        clickMeBtn.sizeToFit()

        let vc = UIHostingController(rootView: Text(NSLocalizedString("click_me", tableName: "lan_ch", comment: "")))
        addChild(vc)
        vc.view.frame = CGRect(x: 100, y: 0, width: 100, height: 100)
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
}
