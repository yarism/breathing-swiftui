//
//  CircleOfLife.swift
//  breathing WatchKit Extension
//
//  Created by Joakim Johansson on 2022-09-02.
//

import SwiftUI

struct CircleOfLife: View {
    @State private var isAnimating = false
    let level: Level
    let radius: CGFloat = 100
    let pi = Double.pi
    let dotCount = 10
    let dotLength: CGFloat = 5
    let spaceLength: CGFloat
    
    init(level: Level) {
        self.level = level
        let circumerence: CGFloat = CGFloat(2.0 * pi) * radius
        spaceLength = circumerence / CGFloat(dotCount) - dotLength
    }


    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Text(level.name)
            ZStack {
                Image(systemName: "heart.fill")
                    .foregroundColor(Color.blue)
                    .frame(width: 100.0, height: 100.0)
                    .scaleEffect(self.isAnimating ? 1 : 2)
                    .onAppear(perform: {
                        isAnimating = true
                    })
                    .animation(Animation.linear(duration: 1).repeatForever())
                    
                Circle()
                    .stroke(Color.white.opacity(0.3), style: StrokeStyle(lineWidth: 20))
                
                Circle()
                    .trim(from: 0, to: 0.1)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 20))
                    .rotationEffect(.init(degrees: -90))
                
            }
        }
    }
}

struct CircleOfLife_Previews: PreviewProvider {
    
    static let easy = Level(name: "Easy", inhale: 3000, exhale: 3000, duration: 60000)
    static var previews: some View {
        CircleOfLife(level: easy)
    }
}
