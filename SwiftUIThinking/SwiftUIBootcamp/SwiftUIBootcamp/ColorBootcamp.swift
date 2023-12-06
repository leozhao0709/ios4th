//
//  ColorBootcamp.swift
//  SwiftUIBootcamp
//
//  Created by Lei Zhao on 7/20/23.
//

import SwiftUI

struct ColorBootcamp: View {
    let colors: [Color] = [
        .red, .orange, .yellow, .green, .mint,
        .teal, .cyan, .blue, .indigo, .purple,
        .pink, .brown, .gray, .primary, .secondary, .accentColor, .black, .white, .clear
    ]

    var body: some View {
        List {
            ForEach(colors, id: \.self) {
                RoundedRectangle(cornerRadius: 25)
                    .fill($0)
                    .frame(width: 300, height: 200)
            }
        }
        
    }
}

struct ColorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorBootcamp()
    }
}
