//
//  Todo.swift
//  TodoList
//
//  Created by Lei Zhao on 4/10/23.
//

import Foundation

struct TodoItem: Identifiable, Codable {
    let id: String
    let content: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, content: String, isCompleted: Bool) {
        self.id = id
        self.content = content
        self.isCompleted = isCompleted
    }
    
    func toggleComplete() -> TodoItem {
        return TodoItem(id: self.id, content: self.content, isCompleted: !self.isCompleted)
    }
}
