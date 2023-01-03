//
//  VibrationBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/18/22.
//

import SwiftUI

class VibrationManager {
    // singleton
    static let sharedInstance = VibrationManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}


struct VibrationBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("success") {
                VibrationManager.sharedInstance.notification(type: .success)
            }
            Button("error") {
                VibrationManager.sharedInstance.notification(type: .error)
            }
            Button("warning") {
                VibrationManager.sharedInstance.notification(type: .warning)
            }
            Divider()
            Button("heavy"){
                VibrationManager.sharedInstance.impact(style: .heavy)
            }
            Button("light"){
                VibrationManager.sharedInstance.impact(style: .light)
            }
            Button("medium"){
                VibrationManager.sharedInstance.impact(style: .medium)
            }
            Button("rigid"){
                VibrationManager.sharedInstance.impact(style: .rigid)
            }
            Button("soft"){
                VibrationManager.sharedInstance.impact(style: .soft)
            }
        }
    }
}

struct VibrationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        VibrationBootcamp()
    }
}
