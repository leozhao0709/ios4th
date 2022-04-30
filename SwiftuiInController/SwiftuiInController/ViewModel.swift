//
// Created by Lei Zhao on 4/29/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published public var model: Model = Model()

    func updateViewModelText(newText: String) {
        model.text = newText
    }
}

extension ViewModel {
    struct Model {
        var text: String = ""
    }
}
