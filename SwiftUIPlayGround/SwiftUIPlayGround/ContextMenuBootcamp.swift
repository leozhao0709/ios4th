//
//  ContextMenuBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/16/22.
//

import SwiftUI

struct ContextMenuBootcamp: View {
    @State private var type = ""
    private let types = ["生活用品", "数码家电", "服饰", "ios学习"]
    
    var body: some View {
        VStack {
            VStack {
                Text("Please Select")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 5)
            }.contextMenu {
                ForEach(types, id: \.self){ option in
                    Button(option) {
                        type = option
                    }
                }
            }
            Text(type)
        }
    }
}

struct ContextMenuBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuBootcamp()
    }
}
