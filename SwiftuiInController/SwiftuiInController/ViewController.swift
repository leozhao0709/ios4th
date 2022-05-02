//
//  ViewController.swift
//  SwiftuiInController
//
//  Created by Lei Zhao on 4/29/22.
//
//

import UIKit
import SwiftUI
import Combine

class ViewController: UIViewController {

    private var viewModel: ViewModel
    var label: UILabel?

    private var cancellables = Set<AnyCancellable>()

    init(viewModel: ViewModel = ViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        navigationController?.title = "ViewController"

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

        viewModel.modelPublisher().sink { [weak self] model in
                    DispatchQueue.main.async {
                        self?.updateLabel()
                    }
                }
                .store(in: &cancellables)


        let vc = UIHostingController(rootView: ContentView(viewModel: viewModel) { [weak self] in
            self?.goToRedVC()
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
        label?.text = viewModel.getMode().text
        label?.sizeToFit()
    }

    private func goToRedVC() {
        print("---go to red view---")
        let redVc = RedViewController()
        navigationController?.pushViewController(redVc, animated: true)
//        navigationController?.setViewControllers([redVc], animated: true)
    }

    deinit {
        print("---ViewController---deinit")
    }
}
