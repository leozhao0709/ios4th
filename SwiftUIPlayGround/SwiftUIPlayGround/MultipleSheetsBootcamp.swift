//
//  MultipleSheetsBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/18/22.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct MultipleSheetsBootcamp: View {
    @State var selectedModel: RandomModel?
    
    var body: some View {
        VStack {
            List(1..<50) { index in
                Button("Button \(index)") {
                    selectedModel = RandomModel(title: "\(index)")
                }
            }
        }.sheet(item: $selectedModel) { model in
            NextScreen(randomModel: model)
        }
    }
}

struct NextScreen: View {
    let randomModel: RandomModel
    @Environment(\.presentationMode) var presentMode
    
    var body: some View {
        Button(randomModel.title) {
            presentMode.wrappedValue.dismiss()
        }
        .font(.largeTitle)
    }
}

struct MultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootcamp()
    }
}
