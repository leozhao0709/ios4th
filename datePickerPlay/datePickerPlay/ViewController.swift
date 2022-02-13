//
//  ViewController.swift
//  datePickerPlay
//
//  Created by Lei Zhao on 2/12/22.
//
//

import UIKit


class ViewController: UIViewController {

    private weak var textField: DatePickTextView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let textField = DatePickTextView(frame: CGRect.zero)
        view.addSubview(textField)

        self.textField = textField
    }


}
