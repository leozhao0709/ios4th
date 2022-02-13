//
// Created by Lei Zhao on 2/12/22.
//

import UIKit
import SnapKit

class DatePickTextView: UITextField {

    private var datePicker: UIDatePicker?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        updateConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func updateConstraints() {
        configAutoLayout()
        super.updateConstraints()
    }

    private func setupUI() {
        datePicker = UIDatePicker()
        inputView = datePicker
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(dateSelect), for: .valueChanged)
    }

    private func configAutoLayout() {
        textInputView.snp.updateConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(20)
        }
    }

    @objc
    private func dateSelect(datePicker: UIDatePicker) {
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"

        text = fmt.string(from: datePicker.date)
    }
}
