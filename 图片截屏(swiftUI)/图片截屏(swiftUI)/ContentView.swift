//
//  ContentView.swift
//  图片截屏(swiftUI)
//
//  Created by Lei Zhao on 11/18/22.
//

import SwiftUI

struct ContentView: View {
    @State var endClip = false
    @State var clipRect = CGRect()
    
    var body: some View {
        ZStack {
            Image("火影")
                .if(endClip) {
                    $0.clipShape(CoverShape(coverRect: clipRect))
                }
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            let width = abs(value.location.x - value.startLocation.x)
                            let height = abs(value.location.y - value.startLocation.y)
                            let x = min(value.location.x, value.startLocation.x)
                            let y = min(value.location.y, value.startLocation.y)
                            clipRect = CGRect(x: x, y: y, width: width, height: height)
                        })
                        .onEnded({ value in
                            endClip = true
                        })
                ).allowsHitTesting(!endClip)
            
            if(!endClip) {
                Rectangle()
                    .fill(.black.opacity(0.7))
                    .frame(width: clipRect.width, height: clipRect.height)
                    .position(x: clipRect.midX, y: clipRect.midY)
            }
        }
        .padding()
        
    }
}

struct CoverShape: Shape {

    var coverRect: CGRect
    
    func path(in rect: CGRect) -> Path {
        return Rectangle().path(in: CGRect(x: coverRect.minX, y: coverRect.minY, width: coverRect.width, height: coverRect.height))
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
public extension View {
   @ViewBuilder
   func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
