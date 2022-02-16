//
// Created by Lei Zhao on 2/14/22.
//

import UIKit

extension UIImage {

    func circleImage() -> UIImage {
//        UIGraphicsBeginImageContext(size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let radius = min(size.width, size.height) * 0.5
        // draw a circle area
        let clipPath = UIBezierPath(arcCenter: center(), radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: false)
        // clip the circle area
        clipPath.addClip()
        // draw image in the clip area
        self.draw(at: CGPoint.zero)

        // getImage
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return img!
    }

    func circleImage(withBorderWidth borderWidth: CGFloat = 0, andBorderColor borderColor: UIColor = UIColor.clear) -> UIImage? {
        let ctxSize = CGSize(width: size.width + 2 * borderWidth, height: size.height + 2 * borderWidth)
        UIGraphicsBeginImageContextWithOptions(ctxSize, false, 0)

        if (borderWidth > 0) {
            let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: ctxSize.width, height: ctxSize.height))
            borderColor.set()
            path.fill()
        }

        let clipPath = UIBezierPath(ovalIn: CGRect(x: borderWidth, y: borderWidth, width: size.width, height: self.size.height))
        clipPath.addClip()
        self.draw(at: CGPoint(x: borderWidth, y: borderWidth))

        let circleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return circleImage
    }

    private func center() -> CGPoint {
        CGPoint(x: size.width * 0.5, y: size.height * 0.5)
    }
}
