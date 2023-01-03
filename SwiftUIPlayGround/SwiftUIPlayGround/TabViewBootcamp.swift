//
//  TabViewBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/16/22.
//

import SwiftUI

struct TabViewBootcamp: View {
    var body: some View {
        TabView {
            Rectangle()
                .fill(.green)
            Rectangle()
                .fill(.yellow)
            Rectangle()
                .fill(.red)
        }
        .frame(height: 300)
        .cornerRadius(20)
        .tabViewStyle(PageTabViewStyle())
    }
}

struct TabViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBootcamp()
    }
}
