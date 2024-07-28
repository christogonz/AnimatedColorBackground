//
//  CustomIconButton.swift
//  BackgroundColorAnimation
//
//  Created by Christopher Gonzalez on 2024-07-27.
//

import SwiftUI

struct CustomIconButton: View {
    @State private var isPressed: Bool = true
    
    var title: String = "Flygplansläge"
    var subTitle: String = "Text Here"
    var icon: String = "person.fill"
     
    var body: some View {
        VStack {
            HStack {
                Image(systemName: icon)
                    .frame(width: 40, height: 40)
                    .background(isPressed ? Color.blue : Color.gray.opacity(0.2))
                    .clipShape(.circle)
                    .padding(.trailing, 6)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title2)
                    Text(subTitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            .padding()
            .frame(width: 335, height: 70)
            .background(.thinMaterial)
            .clipShape(.rect(cornerRadius: 16))
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                isPressed.toggle()
            }
        }
    }
}

#Preview {
    CustomIconButton()
}
