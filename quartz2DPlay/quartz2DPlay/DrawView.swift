//
// Created by Lei Zhao on 2/14/22.
//

import UIKit

class DrawView: UIView {

    private weak var blueView: UIView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemCyan
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }

    private func setupUI() {
        let blueView = UIView()
        blueView.backgroundColor = .systemBlue

        self.blueView = blueView

        addSubview(blueView)
    }

    private func setupUIFrame() {
        let viewWidth = bounds.size.width
        let viewHeight = bounds.size.height
        blueView?.center = CGPoint(x: viewWidth * 0.5, y: viewHeight * 0.5)
        blueView?.bounds = CGRect(x: 0, y: 0, width: viewWidth * 0.5, height: viewHeight * 0.5)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupUIFrame()
    }
}
