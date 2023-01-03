//
//  GridBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/15/22.
//

import SwiftUI

struct GridBootcamp: View {
    
    let columns = [
        GridItem(.flexible(), spacing: 10, alignment: .center), // column spacing
        GridItem(.flexible(), spacing: 10, alignment: .center),
        GridItem(.flexible(), spacing: 10, alignment: .center),
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 10 // row spacing
            ) {
                Section {
                    ForEach(1..<20) {_ in
                        Rectangle()
                            .fill(Color.blue)
                            .frame(height: 50)
                    }
                } header: {
                    Text("Section1")
                }
            }
        }
    }
}

struct GridBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GridBootcamp()
    }
}
