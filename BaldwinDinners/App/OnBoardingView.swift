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
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Text("Welcome to Baldwin Dinners")
            
            Button(action: {
                isOnboarding = false
            }, label: {
                Text("Start")
            })
        }
        
    }
}

// MARK: - BODY
struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
