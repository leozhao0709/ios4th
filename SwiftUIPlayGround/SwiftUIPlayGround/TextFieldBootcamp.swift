//
//  TextFieldBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/17/22.
//

import SwiftUI

struct TextFieldBootcamp: View {
    
    enum SignInFields: Hashable {
        case username
        case password
    }
    
    @State var username = ""
    @State var password = ""
    @FocusState var fieldInFocus: SignInFields?
    
    var angle: Angle = .zero
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .focused($fieldInFocus, equals: .username)
                .padding()
                .background(Color.gray.opacity(0.65))
                .cornerRadius(10)
                .submitLabel(.next)
                .onSubmit {
                    fieldInFocus = .password
                }
            SecureField("Password", text: $password)
                .focused($fieldInFocus, equals: .password)
                .padding()
                .background(Color.gray.opacity(0.65))
                .cornerRadius(10)
                .submitLabel(.done)
                .onSubmit {
                    fieldInFocus = nil
                }
        }.padding(40)
    }
}

struct TextFieldBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBootcamp()
    }
}
