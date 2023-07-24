//
//  ShapeBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Lei Zhao on 7/19/23.
//

import SwiftUI

struct ShapeBootcamp: View {
    
    
    var body: some View {
        let fillColor = Color(#colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 0.9339559189))
        Circle()
            .strokeBorder(.green, lineWidth: 20)
            .background(Circle().fill(fillColor))
//            .fill(.green)
//            .fill(.green)
//            .stroke()
//            .stroke(.green)
//            .stroke(.blue, lineWidth: 30)
//            .stroke(.blue, style: StrokeStyle(lineWidth: 30, lineCap: .butt, dash: [10]))
//            .trim(from: 0.4, to: 1)
    }
}

struct ShapeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ShapeBootcamp()
    }
}
