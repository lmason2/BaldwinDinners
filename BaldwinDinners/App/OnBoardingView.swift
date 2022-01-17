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
        VStack(spacing: 10) {
            Image(colorScheme == .dark ? "logo-white" : "logo-black")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.accentColor, lineWidth: 5))
                .frame(width: 250, height: 250)
            
            HStack {
                Button(action: {
                    let url = URL(string: "instagram://user?username=baldwindinners")!
                            let application = UIApplication.shared
                            if application.canOpenURL(url) {
                                application.open(url)
                            } else {
                                application.open(URL(string: "https://www.instagram.com/baldwindinners/")!)
                            }
                }, label: {
                    Image("insta")
                        .resizable()
                        .frame(width: 50, height: 50)
                })
                
                Button(action: {
                    isOnboarding = false
                }, label: {
                    Image(systemName: "arrow.right")
                        .foregroundColor(Color("Gonzaga-Blue"))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                        .background(
                            Capsule().strokeBorder(Color.accentColor, lineWidth: 1.25)
                        )
                })
            }
            
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
        Group {
            OnBoardingView()
                .preferredColorScheme(.light)
            OnBoardingView()
                .preferredColorScheme(.dark)
        }
    }
}
