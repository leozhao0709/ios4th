//
//  TodoListApp.swift
//  TodoList
//
//  Created by Lei Zhao on 4/9/23.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var todoListViewModel = TodoViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomePage()
            }
            .environmentObject(todoListViewModel)
            .environment(\.locale, todoListViewModel.locale)
        }
    }
}
