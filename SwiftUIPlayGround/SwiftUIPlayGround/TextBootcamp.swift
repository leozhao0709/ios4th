//
//  ContentView.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 11/17/22.
//

import SwiftUI

struct TextBootCamp: View {

    var body: some View {
        Text("""
              Nothing to look forward to 😢
              Create an event or check out the Discover tab!
              """
        )
          .foregroundColor(.black)
          .fontWeight(.bold)
          .kerning(5)// letter space
          // .underline(true, color: .green)
          // .strikethrough(true, color: .red)
          .multilineTextAlignment(.center)
          .lineLimit(nil) // no line limitation
          .lineSpacing(1)
          .allowsTightening(true)
            .truncationMode(.tail) // this will not work when you have enough space
          .padding()
          .background(
            Image("2")
                .resizable()
          )
          .frame(width: 200)
    }
}

struct TextBootCamp_Previews: PreviewProvider {

    static var previews: some View {
        TextBootCamp()
    }
}
