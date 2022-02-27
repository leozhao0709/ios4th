//
// Created by Lei Zhao on 2/26/22.
//

import UIKit

class WaterFallCell: UICollectionViewCell {

    static let identifier = "WaterFallCell"
    var mark: String? {
        didSet {
            label?.text = mark
        }
    }

    private weak var label: UILabel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemOrange
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        let label = UILabel()
        self.label = label

        contentView.addSubview(label)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label?.sizeToFit()
        label?.center = contentView.center
    }
}
