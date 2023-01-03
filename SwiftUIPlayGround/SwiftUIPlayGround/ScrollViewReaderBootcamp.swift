//
//  ScrollViewReaderBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/18/22.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    
    @State var scrollIndex = 0
    @State var textFieldText = ""
    
    var body: some View {
        VStack {
            TextField("Enter a # to scroll to...", text: $textFieldText)
                .frame(height: 50)
                .padding(.horizontal)
                .border(.gray)
                .padding()
            Button("Scroll") {
                if let index = Int(textFieldText) {
                    scrollIndex = index
                }
            }

            ScrollViewReader { proxy in
                ScrollView{
                    ForEach(1..<50) { index in
                        LazyVStack {
                            Text("\(index)")
                                .frame(height: 100)
                                .frame(maxWidth: .infinity)
                                .background(.green)
                                .shadow(radius: 10)
                                .padding()
                                .id(index)
                        }
                    }
                    .onChange(of: scrollIndex) { newValue in
                        withAnimation {
                            proxy.scrollTo(newValue, anchor: .top)
                        }
                    }
                }
            }
        }
    }
}

struct ScrollViewReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderBootcamp()
    }
}
