//
//  AppDelegate.swift
//  LocalNotificationPlay
//
//  Created by Lei Zhao on 3/3/22.
//
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        return true
    }

//    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        print("---deviceToken---", deviceToken)
//    }
//
//    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
//        print("---didFailToRegisterForRemoteNotificationsWithError---", error)
//    }
}


extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> ()) {
        completionHandler()
        if response.notification.request.identifier == OneNotification.requestIdentifier {
            if response.actionIdentifier == OneNotification.readActionIdentifier {
                print("---OneNotification read action---", response.notification)
            }
            // open OneNotification Screen
            print("---open OneNotification Screen---", response.notification)
        }
    }
}