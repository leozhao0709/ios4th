//
//  ColorBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Lei Zhao on 7/20/23.
//

import SwiftUI

struct ColorBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color("CustomColor"))
            .frame(width: 300, height: 200)
//            .shadow(radius: 10)
            .shadow(color: Color("CustomColor"), radius: 10, x: 10, y: 10)
    }
}

struct ColorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorBootcamp()
    }
}
