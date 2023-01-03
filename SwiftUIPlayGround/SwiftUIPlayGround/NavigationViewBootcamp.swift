//
//  NavigationViewBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/17/22.
//

import SwiftUI

struct NavigationViewBootcamp: View {
    @State var count = 0;
    var body: some View {
        NavigationView {
            LazyVStack {
                NavigationLink("go to next", destination: NextView())
                
                Text("Count: \(count)")
                Button("+") {
                    count += 1
                }
                
                Rectangle()
                    .fill(Color(red: 0.5, green: 0.3, blue: 1, opacity: 1))
                    .frame(height: 200)
            }.onDisappear {
                print("---disappera---")
                count -= 1
            }
        }
    }
}

struct NextView: View {
    var body: some View {
        LinearGradient(colors: [Color.orange, Color.yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct NavigationViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewBootcamp()
    }
}
