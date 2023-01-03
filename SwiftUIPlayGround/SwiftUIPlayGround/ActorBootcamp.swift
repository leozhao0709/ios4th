//
//  ActorBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/21/22.
//

import SwiftUI

actor ActorBootcampDataManage {
    static var sharedInstance = ActorBootcampDataManage()
    
    private init() {}
    
    func fetchText() -> String {
        return "New Text"
    }
    
    nonisolated
    func fetchTextSync() -> String {
        return "Sync Text"
    }
}

class ActorBootcampViewModel: ObservableObject {
    @Published var text = ""
    @Published var syncText = ""
    let manager = ActorBootcampDataManage.sharedInstance
    
    func getText() async {
        let text = await manager.fetchText()
        await MainActor.run {
            self.text = text
        }
    }
    
    func getSyncText() {
        self.syncText = manager.fetchTextSync()
    }
}

struct ActorBootcamp: View {
    
    @StateObject var vm = ActorBootcampViewModel()
    
    var body: some View {
        VStack {
            Text(vm.text)
                .task {
                    await vm.getText()
            }
            
            Text(vm.syncText)
                .onAppear {
                    vm.getSyncText()
                }
        }
    }
}

struct ActorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ActorBootcamp()
    }
}
