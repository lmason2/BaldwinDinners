//
//  OnBoardingView.swift
//  BaldwinDinners
//
//  Created by Luke Mason on 1/16/22.
//

import SwiftUI

struct OnBoardingView: View {
    // MARK: - PROPERTIES
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    @Environment(\.colorScheme) var colorScheme
    @State var scale: CGFloat = 0.5
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center) {
            Text("Baldwin Dinners")
                .font(.system(size: 48, weight: .bold, design: .rounded))
                .padding()
            
            Button(action: {
                isOnboarding = false
            }, label: {
                Image(systemName: "flame")
                    .font(.system(size: 50))
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 50)
                    .background(
                        Capsule()
                            .strokeBorder(Color.accentColor, lineWidth: 4)
                    )
            })
        }
        .scaleEffect(scale)
        .onAppear {
            let baseAnimation = Animation.easeInOut(duration: 1)
            
            withAnimation(baseAnimation) {
                scale = 1
            }
        }
        
    }
}

// MARK: - BODY
struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
            .preferredColorScheme(.dark)
    }
}
