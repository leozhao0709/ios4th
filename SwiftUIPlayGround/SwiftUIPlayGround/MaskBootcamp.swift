//
//  MaskBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/18/22.
//

import SwiftUI

struct MaskBootcamp: View {
    @State var rate: CGFloat = 0

    var body: some View {
        StarView
            .overlay {
                GeometryReader { proxy in
                    Rectangle()
                        .fill(Color.yellow.opacity(0.8))
                        .frame(width: rate / 5 * proxy.size.width)
                        .mask(alignment: .leading) {
                            StarView
                        }
                        .allowsHitTesting(false)
                }
            }
    }
    
    private var StarView: some View {
        HStack {
            ForEach(1..<6) {index in
                Image(systemName: "star.fill")
                    .foregroundColor(.gray)
                    .font(.largeTitle)
                    .onTapGesture {
                        withAnimation {
                            rate = CGFloat(index)
                        }
                    }
            }
        }
    }
}


struct MaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MaskBootcamp()
    }
}
