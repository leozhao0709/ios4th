//
// Created by Lei Zhao on 2/12/22.
//

import UIKit

class DatePickTextView: UITextField {

    private weak var datePicker: UIDatePicker?
    private weak var toolbar: UIToolbar?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupUI() {
        // date picker
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateSelect), for: .valueChanged)
        borderStyle = .roundedRect
        self.datePicker = datePicker
        inputView = datePicker

        // toolbar to have confirm and cancel button
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
        let confirmBtn = UIBarButtonItem(title: "Confirm", style: .plain, target: self, action: #selector(confirmSelection))
        let flexSpace = UIBarButtonItem(systemItem: .flexibleSpace)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelSelection))
        toolbar.items = [confirmBtn, flexSpace, cancel]
        inputAccessoryView = toolbar
    }

    @objc
    private func dateSelect(datePicker: UIDatePicker) {
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        text = fmt.string(from: datePicker.date)
    }

    @objc
    private func confirmSelection() {
        dateSelect(datePicker: datePicker!)
        endEditing(true)
    }

    @objc
    private func cancelSelection() {
        endEditing(true)
    }
}
