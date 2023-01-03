//
//  CanvasBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/25/22.
//

import SwiftUI

struct Line {
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 1.0
}

struct CanvasBootcamp: View {
    
    @State var currentLine = Line()
    @State var lines: [Line] = []
    @State var lineWidth = 1.0
    @State var lineColor = Color.red
    
    var body: some View {
        VStack {
            Canvas { context, size in
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        currentLine.color = lineColor
                        currentLine.lineWidth = lineWidth
                        currentLine.points.append(value.location)
                        lines.append(currentLine)
                    })
                    .onEnded({ value in
                        currentLine = Line()
                    })
            )

            
            HStack {
                Slider(value: $lineWidth, in: 1...20, step: 1) {
                    Text("Line Width")
                }.frame(maxWidth: 200)
                
                ColorPicker("", selection: $lineColor)
                    .fixedSize()
            }
            .background()
            .padding()
        }
    }
}

struct CanvasBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CanvasBootcamp()
    }
}
