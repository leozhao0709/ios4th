//
//  OnAppearBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/17/22.
//

import SwiftUI

struct OnAppearBootcamp: View {
    @State var count = 0
    
    var body: some View {
        NavigationView {
//            ScrollView {
                List {
                    ForEach(0..<50) {_ in
                        Rectangle()
                            .cornerRadius(25)
                            .frame(height: 200)
                            .padding()
                            .onAppear{
                                count += 1
                            }
                    }
                }
//                .frame(height: 300)
//                .scaledToFit()
                .listStyle(GroupedListStyle())
//            }
            .navigationTitle("On Appear: \(count)")
        }
    }
}

struct OnAppearBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearBootcamp()
    }
}
