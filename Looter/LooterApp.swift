//
//  LooterApp.swift
//  Looter
//
//  Created by Loris JACOB on 1/19/24.
//

import SwiftUI

@main
struct LooterApp: App {
    
    // Ici utiliser un @AppStorage pour stocker ce booléen entre les lancements de l'application
    @AppStorage var isOnboardingDone: Bool = false
    var body: some Scene {
        WindowGroup {
            if isOnboardingDone {
                ContentView()
            } else {
                // Onboarding
            }
            
        }
    }
}
