//
// Created by Lei Zhao on 2/13/22.
//

import UIKit

class RedViewController: UIViewController {
    private weak var button: UIButton? {
        let btn = UIButton(type: .roundedRect)
        btn.setTitle("toGreenView", for: .normal)
        btn.addTarget(self, action: #selector(toGreenView), for: .touchUpInside)
        btn.sizeToFit()
        btn.center = view.center
        return btn
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        navigationItem.title = "red view"
        let cameraButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(onCameraClick))
        navigationItem.rightBarButtonItems = [cameraButtonItem]
        view.addSubview(button!)
    }

    @objc private func onCameraClick() {
        print("...onCameraClick...")
    }

    @objc private func toGreenView(btn: UIButton) {
        let greenViewCtrl = GreenViewController()
        greenViewCtrl.valueFromLastView = "This message is from red view"
        greenViewCtrl.onPopup = { str in
            print(str)
        }
        navigationController?.pushViewController(greenViewCtrl, animated: true)
    }
}
