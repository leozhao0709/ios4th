//
//  ViewController.swift
//  BlueTooth(MultipeerConnectivity)
//
//  Created by Lei Zhao on 3/6/22.
//

import UIKit

class ViewController: UIViewController {

    private weak var buttonStackView: UIStackView?
    private weak var imageView: UIImageView?
//    private weak var searchDeviceBtn: UIButton?
//    private weak var selectPhotoBtn: UIButton?
//    private weak var sendPhotoBtn: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupImageView()
        setupBtnStackView()
    }

    private func setupImageView() {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        view.addSubview(imageView)

        self.imageView = imageView

        setupImageViewConstrains()
    }

    private func setupBtnStackView() {
        let btn1 = setupButton(title: "Search Device")
        let btn2 = setupButton(title: "Select Photo")
        let btn3 = setupButton(title: "Send Photo")

        let stackView = UIStackView()
        stackView.addArrangedSubview(btn1)
        stackView.addArrangedSubview(btn2)
        stackView.addArrangedSubview(btn3)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        view.addSubview(stackView)

        buttonStackView = stackView

        setupButtonStackViewConstrains()
    }

    private func setupImageViewConstrains() {
        imageView?.translatesAutoresizingMaskIntoConstraints = false

        var constrains = [NSLayoutConstraint]()
        constrains.append(imageView!.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor))
        constrains.append(imageView!.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -150))
        constrains.append(imageView!.widthAnchor.constraint(equalToConstant: 300))
        constrains.append(imageView!.heightAnchor.constraint(equalToConstant: 200))

        NSLayoutConstraint.activate(constrains)
    }

    private func setupButtonStackViewConstrains() {
        buttonStackView?.translatesAutoresizingMaskIntoConstraints = false

        var constrains = [NSLayoutConstraint]()

        constrains.append(buttonStackView!.topAnchor.constraint(equalTo: imageView!.bottomAnchor, constant: 100))
        constrains.append(buttonStackView!.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10))
        constrains.append(buttonStackView!.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10))
        constrains.append(buttonStackView!.heightAnchor.constraint(equalToConstant: 50))

        NSLayoutConstraint.activate(constrains)
    }

    private func setupButton(title: String) -> UIButton {
        let btn = UIButton(type: .roundedRect)
        btn.backgroundColor = UIColor(red: CGFloat.random(in: 0..<1), green: CGFloat.random(in: 0..<1), blue: CGFloat.random(in: 0..<1), alpha: 0.7)
        btn.setTitle(title, for: .normal)
        btn.sizeToFit()
        return btn
    }
}

