//
//  CircleOfLife.swift
//  breathing WatchKit Extension
//
//  Created by Joakim Johansson on 2022-09-02.
//

import SwiftUI

struct CircleOfLife: View {
    @State private var isAnimating = false
    @State private var startAnimation: Double = 0
    @State private var endAnimation: Double = 0
    @State private var themeColor: Color = Color.white.opacity(0.3)
    let level: Level
    let radius: CGFloat = 100
    let pi = Double.pi
    let dotCount = 10
    let dotLength: CGFloat = 5
    let spaceLength: CGFloat
    let delayAnimation: Double = 1.5

    
    init(level: Level) {
        self.level = level
        let circumerence: CGFloat = CGFloat(2.0 * pi) * radius
        spaceLength = circumerence / CGFloat(dotCount) - dotLength
    }

    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Spacer()
            ZStack {
                Image(systemName: "heart.fill")
                    .foregroundColor(themeColor)
                    .frame(width: 80.0, height: 80.0)
                    .scaleEffect(2)
                Circle()
                    .stroke(Color.white.opacity(0.3), style: StrokeStyle(lineWidth: 15))
                Circle()
                    .trim(from: startAnimation, to: endAnimation)
                    .stroke(themeColor, style: StrokeStyle(lineWidth: 15))
                    .rotationEffect(.init(degrees: -90))
                    .onAppear(perform: {
                        withAnimation(.linear(duration: level.inhale.msToSeconds).delay(delayAnimation)) {
                            endAnimation = 1
                            themeColor = Color.blue
                        }
                        withAnimation(.linear(duration: level.inhale.msToSeconds).delay(level.inhale.msToSeconds + delayAnimation)) {
                            startAnimation = 1
                            themeColor = Color.orange
                        }
                    })
                    .onDisappear(perform: {
                        startAnimation = 0
                        endAnimation = 0
                        themeColor = Color.white.opacity(0.3)
                    })
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
