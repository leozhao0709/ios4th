//
//  AnyTransitionBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/22/22.
//

import SwiftUI

struct RotateViewModifier: ViewModifier {
    let degrees: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(degrees))
            .offset(
                x: degrees == 0 ? 0 : UIScreen.main.bounds.width,
                y: degrees == 0 ? 0 : UIScreen.main.bounds.height
            )
    }
}

extension AnyTransition {
    static var rotating: AnyTransition {
        AnyTransition.modifier(active: RotateViewModifier(degrees: 180), identity: RotateViewModifier(degrees: 0)) // active is start and end state, identity is the active state
    }
    
    static func rotating(degrees: Double) -> AnyTransition {
        AnyTransition.modifier(active: RotateViewModifier(degrees: degrees), identity: RotateViewModifier(degrees: 0)) // active is start and end state, identity is the active state
    }
    
    static var rotationOn: AnyTransition {
        AnyTransition.asymmetric(insertion: .rotating, removal: .move(edge: .leading))
    }
}

struct AnyTransitionBootcamp: View {
    
    @State var showRectangle = false
    
    var body: some View {
        VStack {
            Spacer()
            if showRectangle {
                Rectangle()
                    .fill(.orange)
                    .frame(width: 250, height: 350) // rectangle position
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // transition end position
//                    .transition(.slide)
//                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .identity)) // identity means without transition
//                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .bottom)))
//                    .transition(.rotating)
//                    .transition(.rotating(degrees: 120))
//                    .transition(.rotationOn)
                    .overlay {
                        Text("this is text")
                    }
            }

            Spacer()
            Button {
                withAnimation(.easeInOut(duration: 2)) {
                    showRectangle.toggle()
                }
            } label: {
                Text("Click Me!")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
            }

        }
    }
}

struct AnyTransitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnyTransitionBootcamp()
    }
}
