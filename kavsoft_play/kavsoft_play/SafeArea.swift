//
//  SafeArea.swift
//  kavsoft_play
//
//  Created by Lei Zhao on 5/16/23.
//

import SwiftUI

struct SafeArea: View {
    var body: some View {
        ScrollView {
            Text("scroll view")
                .frame(maxWidth: .infinity)
        }
        .background(Color.orange)
        .safeAreaInset(edge: .top) {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .frame(maxWidth: .infinity)
            .background(Color.green)
        }
    }
}

struct SafeArea_Previews: PreviewProvider {
    static var previews: some View {
        SafeArea()
    }
}
