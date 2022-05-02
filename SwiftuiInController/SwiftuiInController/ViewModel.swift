//
// Created by Lei Zhao on 4/29/22.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published private var model: Model = Model()

    func updateViewModelText(newText: String) {
        model.text = newText
    }

    func getMode() -> Model {
        model
    }

    func modelPublisher() -> Published<Model>.Publisher {
        self.$model
    }
}

extension ViewModel {
    struct Model {
        var text: String = "23456"
    }
}
