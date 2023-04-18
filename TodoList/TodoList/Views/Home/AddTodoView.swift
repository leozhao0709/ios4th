//
//  AddTodoView.swift
//  TodoList
//
//  Created by Lei Zhao on 4/11/23.
//

import SwiftUI

struct AddTodoView: View {
    
    @EnvironmentObject var todoViewModel: TodoViewModel
    @Environment(\.presentationMode) var presentMode
    @State var text = ""
    @State var showAlert = false
    @State var alertTitle = ""
    
    var body: some View {
        VStack {
            TextField("Add a new item", text: $text)
                .padding()
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.vertical, 10)
            
            Button(action: {
                saveButtonPressed()
            }) {
                Text("Save")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle("Add An Item 🖊️")
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle))
        }
    }
    
    private func saveButtonPressed() {
        if(text.count < 3) {
            alertTitle = "Your new todo Item must be more than 3 chararcters"
            showAlert.toggle()
            return
        }
        todoViewModel.addTodoItem(content: text)
        presentMode.wrappedValue.dismiss()
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTodoView()
        }
        .environmentObject(TodoViewModel())
    }
}
