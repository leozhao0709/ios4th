//
//  ViewController.swift
//  I18nPlay
//
//  Created by Lei Zhao on 4/23/22.
//
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var clickMeBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        let lang = UserDefaults.standard.value(forKey: "AppleLanguages") as? [String]
        print(lang?.first)

        // Do any additional setup after loading the view.
        clickMeBtn.setTitle(NSLocalizedString("click_me", tableName: "lan_en", comment: ""), for: .normal)
        clickMeBtn.sizeToFit()
    }
}
