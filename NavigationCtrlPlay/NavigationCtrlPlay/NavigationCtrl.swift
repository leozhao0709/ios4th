//
// Created by Lei Zhao on 2/13/22.
//

import UIKit

class NavigationCtrl: UINavigationController {
    init() {
        let rootViewController = RedViewController()
        super.init(rootViewController: rootViewController)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
