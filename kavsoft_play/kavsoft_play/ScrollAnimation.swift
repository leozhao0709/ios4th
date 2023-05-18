//
//  ContentView.swift
//  kavsoft_play
//
//  Created by Lei Zhao on 5/14/23.
//

import SwiftUI

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
    
}

struct ScrollAnimation: View {
    
    @State var scrollOffset: CGFloat = 0
    @State var scrollDelta: CGFloat = 0
    @State var scrollAccumulateDelta: CGFloat = 0
    @State var showHeader = true
    let showHeaderThreshold: CGFloat = 50
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            if(showHeader) {
                HeaderView()
                    .zIndex(1000)
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .top)))
            }
            
            ScrollView {
                LazyVStack {
                    ForEach(1..<8, id: \.self) { index in
                        Image("\(index)")
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: 300)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                    }.padding()
                }
                .padding(.top, 30)
                .background(
                    GeometryReader { proxy in
                        Color.clear.preference(key: ScrollOffsetPreferenceKey.self, value: proxy.frame(in: .named("scroll")).origin )
                    })
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    
                    let currScrollDelta = (value.y - self.scrollOffset)
                    
                    
                    if (currScrollDelta * self.scrollDelta > 0) {
                        
                        // small improvement: only if scroll to bottom and header not showing, then we accumalate delta can help save some calculation. Same as scroll to top.
                        if(currScrollDelta < 0 && self.showHeader || currScrollDelta > 0 && !self.showHeader) {
                            // same direction
                            self.scrollAccumulateDelta += currScrollDelta
                        }
                        
                    } else {
                        self.scrollAccumulateDelta = currScrollDelta
                    }
                    
                    withAnimation {
                        if(abs(self.scrollAccumulateDelta) > self.showHeaderThreshold) {
                            if(currScrollDelta > 0) {
                                // scroll to top
                                self.showHeader = true
                            } else {
                                self.showHeader = false
                            }
                            
                            self.scrollAccumulateDelta = 0
                        }
                    }
                    
                    self.scrollDelta = currScrollDelta
                    self.scrollOffset = value.y
                }
            }
            .coordinateSpace(name: "scroll")
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        ZStack {
            Rectangle()
                .fill(.white)
            Text("This is Header")
        }
        .background(Color.white)
        .frame(height: 44)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollAnimation()
    }
}
