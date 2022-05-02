//
// Created by Lei Zhao on 4/29/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    var onGoToRedViewClick: () -> Void

    var body: some View {
        VStack {
            Text(viewModel.getMode().text)
                    .background(Color.purple)
            Button("change Text") {
                let newText = "---SwiftUI--\(Int.random(in: 0..<100))"
                viewModel.updateViewModelText(newText: newText)
            }

            Button("Go to Red View") {
                onGoToRedViewClick()
            }
        }
    }
}

