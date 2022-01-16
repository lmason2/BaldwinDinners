//
//  BaldwinDinnersApp.swift
//  BaldwinDinners
//
//  Created by Luke Mason on 1/16/22.
//

import SwiftUI

@main
struct BaldwinDinnersApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnBoardingView()
            }
            else {
                ContentView()
            }
        }
    }
}
