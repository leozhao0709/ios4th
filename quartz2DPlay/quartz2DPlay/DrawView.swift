//
// Created by Lei Zhao on 2/14/22.
//

import UIKit

class DrawView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemCyan
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let image = UIImage(named: "me")

//        let ctx = UIGraphicsGetCurrentContext()
//        ctx?.addArc(center: viewCenter(), radius: bounds.size.width * 0.5, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
//        ctx?.clip()

        let path = UIBezierPath(arcCenter: viewCenter(), radius: bounds.size.width * 0.5, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
//        path.addClip()
        path.removeAllPoints()
        image?.draw(in: rect)
    }

    private func viewCenter() -> CGPoint {
        let viewWidth = bounds.size.width
        let viewHeight = bounds.size.height
        return CGPoint(x: viewWidth * 0.5, y: viewHeight * 0.5)
    }
}
