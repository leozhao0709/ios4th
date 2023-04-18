//
//  TodoViewModel.swift
//  TodoList
//
//  Created by Lei Zhao on 4/10/23.
//

import Foundation

class TodoViewModel: ObservableObject {
    let todoItemsKey = "todoItems"
    var isSaving = true
    
    @Published var todoItems: [TodoItem] = [] {
        didSet {
            if(isSaving) {
                saveTodoItems()
            }
        }
    }
    
    @Published var locale = Locale(identifier: (UserDefaults.standard.value(forKey: "AppleLanguages") as? [String])?.first ?? "en")
    
    init() {
        self.todoItems = getTodos()
    }
    
    init(todoItems: [TodoItem], isSaving: Bool = true) {
        self.isSaving = isSaving
        self.todoItems = todoItems
    }
    
    private func getTodos() -> [TodoItem] {        
        guard let userData = UserDefaults.standard.data(forKey: todoItemsKey),
              let todoItems = try? JSONDecoder().decode([TodoItem].self, from: userData) else {
            return []
        }

        return todoItems
    }
    
    func changeLocale(identifier: String) {
        self.locale = Locale(identifier: identifier)
    }
    
    func addTodoItem(content: String) {
        self.todoItems.append(TodoItem(content: content, isCompleted: false))
    }
    
    func deleteTodoItem(indexSet: IndexSet) {
        self.todoItems.remove(atOffsets: indexSet)
    }
    
    func moveTodoItem(fromOffsets: IndexSet, toOffset: Int) {
        print("---\(fromOffsets.startIndex)----\(fromOffsets.endIndex)--- \(toOffset)")
        self.todoItems.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
    
    func toggleTodoItemComplete(todoItem: TodoItem) {
        let itemIndex = self.todoItems.firstIndex {
            todoItem.id == $0.id
        }
        
        guard let itemIndex = itemIndex else {
            return
        }
        self.todoItems[itemIndex] = todoItem.toggleComplete()
    }
    
    private func saveTodoItems() {
        guard let encodeData = try? JSONEncoder().encode(self.todoItems) else {
            return
        }
        UserDefaults.standard.set(encodeData, forKey: todoItemsKey)
    }
}
