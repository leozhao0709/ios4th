//
//  ViewController.swift
//  datePickerPlay
//
//  Created by Lei Zhao on 2/12/22.
//
//

import UIKit
import SnapKit


class ViewController: UIViewController {

    private weak var textField: DatePickTextView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let textField = DatePickTextView(frame: .zero)
        view.addSubview(textField)
        self.textField = textField

        configAutoLayout()
    }

    private func configAutoLayout() {
        textField?.snp.updateConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(320)
            make.height.equalTo(30)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
