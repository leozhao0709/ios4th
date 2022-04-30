//
//  ViewController.swift
//  SwiftuiInController
//
//  Created by Lei Zhao on 4/29/22.
//
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    var viewModel = ViewModel()
    var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let btn = UIButton(type: .roundedRect)
        btn.setTitle("clickMe", for: .normal)
        btn.sizeToFit()
        btn.center = view.center
        btn.addTarget(self, action: #selector(clickMe), for: .touchUpInside)
        view.addSubview(btn)

        let label = UILabel()
        label.sizeToFit()
        label.center = CGPoint(x: 100, y: 300)
        view.addSubview(label)
        self.label = label
        updateLabel()

        let vc = UIHostingController(rootView: ContentView(viewModel: self.viewModel) {
            self.updateLabel()
        })
        addChild(vc)
        vc.view.frame = CGRect(x: 100, y: 20, width: 200, height: 200)
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }

    @objc
    private func clickMe() {
        let newText = "---ViewController--\(Int.random(in: 0..<100))"
        viewModel.updateViewModelText(newText: newText)
        updateLabel()
    }

    private func updateLabel() {
        label?.text = viewModel.model.text
        label?.sizeToFit()
    }
}
