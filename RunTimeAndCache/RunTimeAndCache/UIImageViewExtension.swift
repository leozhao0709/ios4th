//
// Created by Lei Zhao on 2/20/22.
//

import UIKit

let MYKEY = "myKey"

extension UIImageView {

    private var currentUrl: String? {
        get {objc_getAssociatedObject(self, MYKEY) as? String}
        set {objc_setAssociatedObject(self, MYKEY, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)}
    }

    func setImageUrl(url: String) {
        if url == currentUrl {
            print("---sameUrl---", url)
            return
        }
        currentUrl = url
        print("---setCurrentUrlTo---", url)
    }
}
