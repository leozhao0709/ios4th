//
// Created by Lei Zhao on 2/11/22.
//

import Foundation

@objcMembers
class BlogModel: NSObject {
    var text: String?
    var icon: String!
    var name: String!
    var picture: String?
    var vip: NSNumber!

    init(dict: [String: Any]) {
        super.init()
        setValuesForKeys(dict)
    }
}
