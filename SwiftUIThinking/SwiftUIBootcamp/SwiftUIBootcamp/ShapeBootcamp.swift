//
//  ShapeBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Lei Zhao on 7/19/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct ShapeBootcamp: View {
    
    var body: some View {
        let fillColor = Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
        VStack{
            Circle()
            // .strokeBorder(.green, lineWidth: 20)
            // .background(Circle().fill(fillColor))
                .fill(Color.pink)
                .stroke(fillColor)
            //            .stroke()
            //            .stroke(.green)
            //            .stroke(.blue, lineWidth: 30)
            //            .stroke(.blue, style: StrokeStyle(lineWidth: 30, lineCap: .butt, dash: [10]))
            //            .trim(from: 0.4, to: 1)
        }
        
    }
}

struct ShapeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            ShapeBootcamp()
        } else {
            // Fallback on earlier versions
        }
    }
}
