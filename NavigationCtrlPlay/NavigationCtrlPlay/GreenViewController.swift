//
// Created by Lei Zhao on 2/13/22.
//

import UIKit

class GreenViewController: UIViewController {
    var valueFromLastView: String?
    var onPopup: ((_ str: String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        navigationItem.title = "green view"
//        navigationItem.backButtonTitle = "返回"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(popBack))
        print(valueFromLastView)
    }

    @objc private func popBack() {
        onPopup?("message from GreenView")
        navigationController?.popViewController(animated: true)
    }
}
