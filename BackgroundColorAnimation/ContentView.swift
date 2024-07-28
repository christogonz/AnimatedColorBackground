//
//  ContentView.swift
//  BackgroundColorAnimation
//
//  Created by Christopher Gonzalez on 2024-07-27.
//

import SwiftUI

struct ContentView: View {
    @State var start = UnitPoint(x: 0, y: 0)
    @State var end = UnitPoint(x: 5, y: 1)
    
    let colors = [Color(.blue).opacity(0.4), Color(.purple).opacity(0.5), Color(.red).opacity(0.5)]
    
    let timer = Timer.publish(every: 0.2, on: .main, in: .default).autoconnect()
    
    var body: some View {
        ZStack {
            AnimatedColorBackground()
                .background(.thickMaterial)
            
            VStack(spacing: 20) {
                
                CustomIconButton(title: "Flygplansläge", subTitle: "På", icon: "airplane")
                CustomIconButton(title: "AirDrop", subTitle: "Bara kontakter"
                                 ,icon: "airplayaudio")
                CustomIconButton(title: "Wi-Fi", subTitle: "Gonzalez_wifi", icon: "wifi")
                CustomIconButton(title: "Mobiledata", subTitle: "Av", icon: "cellularbars")
                CustomIconButton(title: "Bluetooth", subTitle: "På", icon: "antenna.radiowaves.left.and.right")
                CustomIconButton(title: "Internetdelning", subTitle: "av", icon: "personalhotspot")
                CustomIconButton(title: "VPN", subTitle: "av", icon: "network.badge.shield.half.filled")
                
                
            }
        
        }
    }

    var background: some View {
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
    ContentView()
}
