//
//  ContentView.swift
//  glowgoal
//
//  Created by Angela Feng on 11/19/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Habit.name) private var habits: [Habit]
    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationView {
            List {
                ForEach(habits, id: \.id) { habit in
                    NavigationLink(destination: ViewHabitView(habit: habit)) {
                        HStack {
                            Text(habit.name)
                                .font(.headline)
                            Spacer()
                            Button(action: {
                                completeHabit(habit)
                            }) {
                                Image(systemName: habit.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(habit.isCompleted ? .green : .gray)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }
            }
            .navigationTitle("Habits")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddHabitView()) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }

    private func completeHabit(_ habit: Habit) {
        habit.isCompleted = true
        habit.currentStreak += 1
        habit.dayUntilReward -= 1

        if habit.dayUntilReward <= 0 {
            // Reset dayUntilReward to 7 if a reward is achieved
            habit.dayUntilReward = 7
        }

        do {
            try context.save()
        } catch {
            print("Failed to update habit: \(error)")
        }
    }
}



#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
