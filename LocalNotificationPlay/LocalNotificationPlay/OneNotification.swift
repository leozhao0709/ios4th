import UserNotifications
import UIKit

class OneNotification: NSObject {

    static let requestIdentifier = "OneNotification"
    static let readActionIdentifier = "Read"
    private static let center = UNUserNotificationCenter.current()

    public static func requestNotification() {
        center.requestAuthorization(options: [.badge]) { granted, error in

            if !granted || error != nil {
                // handle deny or error
                return
            }
            OperationQueue.main.addOperation { [self] in
                UIApplication.shared.registerForRemoteNotifications()
                triggerNotification()
            }
        }
    }

    private static func triggerNotification() {
        let content = UNMutableNotificationContent()
        let categoryIdentifier = "com.lzhao.localNotification"
        content.title = "This is title"
        content.body = "This is body"
        content.sound = .default
        content.badge = UIApplication.shared.applicationIconBadgeNumber + 1 as NSNumber
        content.categoryIdentifier = categoryIdentifier

        // set action button (long press notification will show this button)
        let readAction = UNNotificationAction(identifier: readActionIdentifier, title: "Read", options: [.foreground])
        let readCategory = UNNotificationCategory(identifier: categoryIdentifier, actions: [readAction], intentIdentifiers: [])
        center.setNotificationCategories([readCategory])

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

//        var dateComponents = DateComponents()
//        dateComponents.second = 20 // fires at each minutes 20s
//        // another way to get date components
////        let randVerseDateComponents = Calendar.current.dateComponents([.second], from: randVerseDate)
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        let request = UNNotificationRequest.init(identifier: requestIdentifier, content: content, trigger: trigger)
        center.add(request)

//        // get all pendingNotification
//        center.getPendingNotificationRequests { requests in
//            print("----", requests)
//        }

//            center.removeAllDeliveredNotifications()
//            center.removeAllPendingNotificationRequests()
//            center.removeDeliveredNotifications(withIdentifiers: [identifier])
//            center.removePendingNotificationRequests(withIdentifiers: [identifier])
    }
}