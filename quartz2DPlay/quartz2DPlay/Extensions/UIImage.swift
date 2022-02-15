//
// Created by Lei Zhao on 2/14/22.
//

import UIKit

extension UIImage {

    func circleImage() -> UIImage {
        UIGraphicsBeginImageContext(size)
        let radius = min(size.width, size.height) * 0.5
        let clipPath = UIBezierPath(arcCenter: center(), radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: false)
        clipPath.addClip()
        self.draw(at: CGPoint(x: 0, y: 0))

        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return img!
    }

    private func center() -> CGPoint {
        CGPoint(x: size.width * 0.5, y: size.height * 0.5)
    }
}
