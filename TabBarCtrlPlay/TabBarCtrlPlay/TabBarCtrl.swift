//
// Created by Lei Zhao on 2/13/22.
//

import UIKit

class TabBarCtrl: UITabBarController {
    init() {
        super.init(nibName: nil, bundle: nil)
        setupTabBar()
        setupChildCtrl()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTabBar() {
        if #available(iOS 15.0, *) {

            let tabBarAppearance = UITabBarAppearance()
            let tabBarItemAppearance = UITabBarItemAppearance()

            tabBarAppearance.backgroundColor = .white

            tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemOrange]
            tabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemPink]

            tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
            tabBar.standardAppearance = tabBarAppearance
            tabBar.scrollEdgeAppearance = tabBarAppearance

        } else {
            UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.systemOrange], for: .normal)
            UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.systemPink], for: .selected)
            tabBar.barTintColor = .white
        }
    }

    private func setupChildCtrl() {
        let ctrl1 = UIViewController()
        ctrl1.view.backgroundColor = .systemTeal
        addChildTabCtrl(ctrl: ctrl1, title: "ctrl1", img: UIImage(named: "tab_buddy_nor"), selectedImg: nil)

        let ctrl2 = UIViewController()
        ctrl2.view.backgroundColor = .cyan
        addChildTabCtrl(ctrl: ctrl2, title: "ctr2", img: UIImage(named: "tab_qworld_nor"), selectedImg: nil)
    }

    private func addChildTabCtrl(ctrl: UIViewController, title: String?, img: UIImage?, selectedImg: UIImage?) {
        ctrl.title = title
        ctrl.tabBarItem.image = img
        ctrl.tabBarItem.selectedImage = selectedImg
        ctrl.navigationItem.title = "nav " + (title ?? "")

        let navCtrl = UINavigationController(rootViewController: ctrl)
        addChild(navCtrl)
    }
}
