//
//  ToggleBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/16/22.
//

import SwiftUI

struct ToggleBootcamp: View {
    @State var isOn = false
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text("Change status")
        }
        .fixedSize()
        .toggleStyle(SwitchToggleStyle(tint: Color.purple))
    }
}

struct ToggleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ToggleBootcamp()
    }
}
