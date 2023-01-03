//
//  SubscribeBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/21/22.
//

import SwiftUI
import Combine

class SubscribeViewModel: ObservableObject {
    @Published var count = 0
    @Published var textFieldText = ""
    @Published var buttonDisabled = true
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        setupButtonDisabled()
    }
    
    func setupButtonDisabled() {
        $textFieldText
//            .combineLatest(<#T##other: Publisher##Publisher#>)
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main) // debounce
            .sink { [weak self] textValue in
                self?.buttonDisabled = textValue.count <= 3
            }
            .store(in: &cancellables)
    }
    
}

struct SubscribeBootcamp: View {
    @StateObject var vm = SubscribeViewModel()
    
    var body: some View {
        VStack {
            
            TextField("type something here...", text: $vm.textFieldText)
                .padding()
                .background(Color.gray.opacity(0.5))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button("Submit") {
                
            }
            .opacity(vm.buttonDisabled ? 0.5 : 1)
            .disabled(vm.buttonDisabled)
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.blue.opacity(vm.buttonDisabled ? 0.5 : 1))
            .cornerRadius(10)
            .padding()
        }
    }
}

struct SubscribeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SubscribeBootcamp()
    }
}
