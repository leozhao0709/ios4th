//
// Created by Lei Zhao on 5/1/22.
//

import UIKit

class NavigationCtrl: UINavigationController {

    // no override here!
    init() {
        let rootViewController = ViewController()
        super.init(rootViewController: rootViewController)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
