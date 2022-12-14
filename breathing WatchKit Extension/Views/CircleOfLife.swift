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
    @State private var timer: Double = 0
    let level: Level
    let radius: CGFloat = 100
    let pi = Double.pi
    let dotCount = 10
    let dotLength: CGFloat = 5
    let spaceLength: CGFloat
    let delayAnimation: Double = 1.5
    
    init(level: Level) {
        self.level = level
        self.timer2 = Timer.publish(every: level.inhale.msToSeconds, on: .main, in: .common).autoconnect()
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
                        animate()
                        Task {
                            await blaha()
                        }
                    })
                    .onDisappear(perform: {
                        startAnimation = 0
                        endAnimation = 0
                        themeColor = Color.white.opacity(0.3)
                        timer = 0
                    })
            }
        }
    }
    
    private func animate() {
        withAnimation(.linear(duration: level.inhale.msToSeconds).delay(delayAnimation)) {
            endAnimation = 1
            themeColor = Color.blue
        }
        withAnimation(.linear(duration: level.exhale.msToSeconds).delay(level.inhale.msToSeconds + delayAnimation)) {
            startAnimation = 1
            themeColor = Color.orange
        }
        timer = delayAnimation + level.inhale.msToSeconds + level.exhale.msToSeconds
    }
    
    private func blaha() async {
        try? await Task.sleep(nanoseconds: UInt64(timer * 1000000000))
        resetCircle()
        withAnimation(.linear(duration: level.inhale.msToSeconds)) {
            endAnimation = 1
            themeColor = Color.blue
        }
        withAnimation(.linear(duration: level.inhale.msToSeconds).delay(level.inhale.msToSeconds)) {
            startAnimation = 1
            themeColor = Color.orange
        }
    }
    
    private func resetCircle() {
        startAnimation = 0
        endAnimation = 0
    }
    
    private func test() {
        print("test")
    }

}

struct CircleOfLife_Previews: PreviewProvider {
    static let easy = Level(name: "Easy", inhale: 3000, exhale: 3000, duration: 60000)
    static var previews: some View {
        CircleOfLife(level: easy)
    }
}
