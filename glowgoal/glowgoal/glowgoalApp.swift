//
//  glowgoalApp.swift
//  glowgoal
//
//  Created by Angela Feng on 11/19/24.
//

import SwiftUI
import SwiftData

@main
struct GlowGoalApp: App {
    // Injecting the model context
  
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [ Habit.self])
        }
    }
}
