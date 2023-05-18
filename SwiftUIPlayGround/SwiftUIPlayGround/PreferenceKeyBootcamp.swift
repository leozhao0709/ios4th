//
//  PreferenceKeyBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/23/22.
//

import SwiftUI

struct RectGeometryPreferenceKey: PreferenceKey {

    static var defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
    }
}


struct PreferenceKeyBootcamp: View {
    
    @State var rectangleCount: Int = 3
    
    @State var rectSize = CGSize.zero
    
    var body: some View {
        
        ZStack {
            VStack {
                Spacer()
                Text(rectSize.debugDescription)
                    .frame(width: rectSize.width, height: rectSize.height)
                    .background(.blue)
                
                Spacer()
                
                HStack {
                    Button("+1") {
                        rectangleCount += 1
                    }
                    .buttonStyle(BorderedProminentButtonStyle())
                    .foregroundColor(.white)
                    
                    Button("-1") {
                        rectangleCount -= 1
                    }
                    .buttonStyle(BorderedProminentButtonStyle())
                    .foregroundColor(.white)
                }
                
                HStack {
                    ForEach(0..<rectangleCount, id: \.self) {_ in
                        GeometryReader { proxy in
                            Rectangle()
                                .preference(key: RectGeometryPreferenceKey.self, value: proxy.size)
                        }
                    }
                }
                .frame(height: 100)
            }
            .onPreferenceChange(RectGeometryPreferenceKey.self, perform: { value in
                self.rectSize = value
            })
        }
    }
}

struct PerferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeyBootcamp()
    }
}
