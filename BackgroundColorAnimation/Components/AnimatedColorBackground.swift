//
//  AnimatedColorBackground.swift
//  BackgroundColorAnimation
//
//  Created by Christopher Gonzalez on 2024-07-28.
//

import SwiftUI

struct AnimatedColorBackground: View {
    @State var start = UnitPoint(x: 0, y: 0)
    @State var end = UnitPoint(x: 5, y: 1)
    
    let colors = [
        Color(.blue).opacity(0.4),
        Color(.purple).opacity(0.5),
        Color(.red).opacity(0.5),
    ]
    
    let timer = Timer.publish(every: 0.2, on: .main, in: .default).autoconnect()
    
    var body: some View {
        LinearGradient(colors: colors, startPoint: start, endPoint: end)
            .onReceive(timer, perform: { _ in
                withAnimation(.easeInOut(duration: 10).repeatForever(autoreverses: true)) {
                    self.start = UnitPoint(x: 4, y: 0)
                    self.end = UnitPoint(x: 0, y: 2)
                    self.start = UnitPoint(x: -4, y: 20)
                    self.start = UnitPoint(x: 4, y: 0)
                }
                
            })
            .ignoresSafeArea()
    }
}

#Preview {
    AnimatedColorBackground()
}
