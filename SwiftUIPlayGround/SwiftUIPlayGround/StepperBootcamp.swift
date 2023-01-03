//
//  StepperBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/16/22.
//

import SwiftUI

struct StepperBootcamp: View {
    @State var stepperValue = 10
    @State var widthIncreament: CGFloat = 0
    
    var body: some View {
        VStack {
            Stepper("Stepper \(stepperValue)", value: $stepperValue, in: 5...15, step: 2)
                .fixedSize()
            
            Rectangle()
                .cornerRadius(20)
                .frame(width: 100 + widthIncreament, height: 100)
            
            Stepper("stepper 2") {
                withAnimation {
                    widthIncreament += 50
                }
            } onDecrement: {
                withAnimation {
                    widthIncreament -= 50
                }
            }
        }
    }
}

struct StepperBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StepperBootcamp()
    }
}
