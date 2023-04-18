//
//  HomePage.swift
//  TodoList
//
//  Created by Lei Zhao on 4/13/23.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var todoViewModel: TodoViewModel
    
    var body: some View {
        let items = todoViewModel.todoItems
        
        VStack {
            if(items.count == 0) {
                NoTodoView()
            } else {
                TodoListView()
            }
            
            Button("change lan") {                
                let currentLocalIdentifier = todoViewModel.locale.identifier
                todoViewModel.changeLocale(identifier: currentLocalIdentifier == "en" ? "zh" : "en")
            }
        }
        .navigationTitle("TodoListNavTitle \("123") \("123")")
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomePage()
        }
        .environmentObject(TodoViewModel())
    }
}
