//
//  ShapeBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/15/22.
//

import SwiftUI

struct ShapeBootcamp: View {
    var body: some View {
        Circle()
//            .fill(Color.orange)
//            .stroke(Color.orange, style: StrokeStyle(
//                lineWidth: 30, lineCap: .butt, dash: [30]
//            ))
            .trim(from: 0.2, to: 1) // trim the shape, useful for like loading
            .stroke(Color.purple, lineWidth: 30)
            .frame(maxWidth: 200)
    }
}

struct ShapeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ShapeBootcamp()
    }
}
