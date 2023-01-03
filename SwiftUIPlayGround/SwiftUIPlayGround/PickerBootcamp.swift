//
//  PickerBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/16/22.
//

import SwiftUI

struct PickerBootcamp: View {
    @State private var type = "生活用品"
    private let types = ["生活用品", "数码家电", "服饰", "ios学习"]
    
    var body: some View {
        VStack {
            Menu {
                Picker("Picker", selection: $type) {
                    ForEach(types, id: \.self) { type in
                        HStack {
                            Text(type)
                            Image(systemName: "heart.fill")
                        }
                    }
                }
            } label: {
                Text("Picker: \(type)")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
            }
            Spacer()
        }
    }
}

struct PickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PickerBootcamp()
    }
}
