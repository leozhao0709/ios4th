//
//  TextBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Lei Zhao on 7/19/23.
//

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
        VStack {
            Text("Hello, world! This is a really Long text".capitalized)
//                .font(.largeTitle)
//                .fontWeight(.bold)
                .underline(pattern: .dashDot, color: .red)
                .strikethrough(pattern: .dashDot, color: .red)
                .font(.system(size: 24, weight: .semibold, design: .serif))
                .baselineOffset(50) // line space
//                .kerning(10) // letter space
                .multilineTextAlignment(.center)
//                .frame(width: 200, height: 200, alignment: .leading)
                .minimumScaleFactor(1)
            
                
        }
    }
}

struct TextBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootcamp()
    }
}
