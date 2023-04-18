//
//  NoTodoView.swift
//  TodoList
//
//  Created by Lei Zhao on 4/11/23.
//

import SwiftUI

struct NoTodoView: View {
    
    @State var isAnimating = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text("There are no items!")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 20)
                .padding(.bottom, 10)
            
            Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
            
            NavigationLink {
                AddTodoView()
            } label: {
                Text("Add something 🥳")
                    .padding()
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .padding(.horizontal, isAnimating ? 30 : 50)
                    .scaleEffect(isAnimating ? 1.1 : 1.0)
            }
            .padding(.top, 10)
            
            Spacer()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() ) {
                withAnimation(Animation.easeOut(duration: 1.0).repeatForever()) {
                    isAnimating = true
                }
            }
        }
    }
}

struct NoTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoTodoView()
                .navigationTitle("Todo List")
        }
    }
}
