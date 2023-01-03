//
//  ColorPickerBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/16/22.
//

import SwiftUI

struct ColorPickerBootcamp: View {
    @State var backgroundColor = Color.green
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()

            ColorPicker(
                "Pick a color",
                selection: $backgroundColor,
                supportsOpacity: true
            )
            .fixedSize()
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .font(.headline)
            .cornerRadius(10)
        }
    }
}

struct ColorPickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerBootcamp()
    }
}
