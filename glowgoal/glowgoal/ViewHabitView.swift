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

            Toggle("Completed Today", isOn: $habit.isCompleted)
                .onChange(of: habit.isCompleted) { newValue in
                    if newValue {
                        habit.currentStreak += 1
                        habit.dayUntilReward -= 1
                        if habit.dayUntilReward <= 0 {
                            habit.dayUntilReward = 7
                        }
                    }
                }

            Spacer()
        }
        .padding()
        .navigationTitle("Habit Details")
    }
}
