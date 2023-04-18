//
//  TodoListView.swift
//  TodoList
//
//  Created by Lei Zhao on 4/10/23.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var todoViewModel: TodoViewModel
    
    var body: some View {
        List {
            ForEach(todoViewModel.todoItems) { item in
                TodoListRowView(todoItem: item)
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.3)) {
                            todoViewModel.toggleTodoItemComplete(todoItem: item)
                        }
                    }
                //                            .listRowSeparator(.hidden)
            }
            .onDelete(perform: todoViewModel.deleteTodoItem)
            .onMove(perform: todoViewModel.moveTodoItem)
        }
        .listStyle(PlainListStyle())
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add", destination: AddTodoView())
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var todoViewModelFake = TodoViewModel(todoItems: [
        TodoItem(content: "This is the 1st Todo", isCompleted: true),
        TodoItem(content: "This is the 2nd Todo", isCompleted: false),
        TodoItem(content: "This is the 3rd Todo", isCompleted: false),
    ], isSaving: false)
    
    static var todoViewModel = TodoViewModel()
    
    static var previews: some View {
        Group {
            NavigationView {
                TodoListView()
                    .navigationTitle("Todo List 📝")
                    .environmentObject(todoViewModelFake)
            }
        }
    }
}
