//
//  ViewController.swift
//  ContactPlay(通讯录获取)
//
//  Created by Lei Zhao on 3/5/22.
//
//

import UIKit
import ContactsUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        let contactVC = CNContactPickerViewController()
        contactVC.delegate = self
        present(contactVC, animated: true)
    }
}

extension ViewController: CNContactPickerDelegate {
    public func contactPickerDidCancel(_ picker: CNContactPickerViewController) {}

    public func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        print("---contact---", contact.givenName, contact.phoneNumbers.first?.value.stringValue)
    }

    public func contactPicker(_ picker: CNContactPickerViewController, didSelect contactProperty: CNContactProperty) {
    }

//    // select multiple contacts
//    public func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
//    }
//
//    public func contactPicker(_ picker: CNContactPickerViewController, didSelectContactProperties contactProperties: [CNContactProperty]) {
//    }
}
