//
//  MatchedGeometryEffectBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/22/22.
//

import SwiftUI

struct MatchedGeometryEffectBootcamp: View {
    @State private var atTop = true

    @Namespace private var circleNamespace
    var body: some View {
        VStack {
            if atTop {
                Circle()
                    .fill(LinearGradient(colors: [Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)),Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))], startPoint: .top, endPoint: .bottom))
                    .matchedGeometryEffect(id: "circle", in: circleNamespace)
                    .frame(height: 100)
            }
            Spacer()
            if !atTop {
                Circle()
                    .fill(LinearGradient(colors: [Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)),Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))], startPoint: .top, endPoint: .bottom))
                    .matchedGeometryEffect(id: "circle", in: circleNamespace)
                    .frame(height: 200)
            }
        }
        .frame(maxWidth: .infinity)
        .background(.orange)
        .onTapGesture {
            withAnimation(.spring()) {
                atTop.toggle()
            }
        }
    }
}

struct MatchedGeometryEffectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffectBootcamp()
    }
}
