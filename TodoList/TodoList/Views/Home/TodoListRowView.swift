//
//  TodoListRowView.swift
//  TodoList
//
//  Created by Lei Zhao on 4/10/23.
//

import SwiftUI

struct TodoListRowView: View {

    let todoItem: TodoItem
    
    var body: some View {
        HStack {
            Text(Image(systemName: todoItem.isCompleted ? "checkmark.circle" : "circle"))
                .foregroundColor(todoItem.isCompleted ? Color.green : Color.red)

            Text(todoItem.content)
            Spacer()
        }
    }
}

struct TodoListRowView_Previews: PreviewProvider {
    
    static let todoItem1 = TodoItem(content: "First Todo Item!", isCompleted: true)
    
    static let todoItem2 = TodoItem(content: "Second Todo Item!", isCompleted: false)
    
    static var previews: some View {
        Group {
            TodoListRowView(todoItem: todoItem1)
            TodoListRowView(todoItem: todoItem2)
        }
        .previewLayout(.sizeThatFits)
    }
}
