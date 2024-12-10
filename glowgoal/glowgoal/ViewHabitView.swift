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
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

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
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: deleteHabit) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
            }
        }
    }

    private func deleteHabit() {
    
        modelContext.delete(habit)

        
        do {
            try modelContext.save()
            dismiss()
        } catch {
            print("Failed to delete habit: \(error)")
        }
    }
}
