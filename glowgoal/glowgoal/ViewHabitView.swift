//
//  ViewHabitView.swift
//  glowgoal
//
//  Created by Angela Feng on 11/19/24.
//


import SwiftUI
import SwiftData

struct ViewHabitView: View {
    @Bindable var habit: Habit

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(habit.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Current Streak: \(habit.currentStreak)")
                .font(.headline)

            Text("Days Until Reward: \(habit.dayUntilReward)")
                .font(.headline)

            

            Spacer()
        }
        .padding()
        .navigationTitle("Habit Details")
    }
}
