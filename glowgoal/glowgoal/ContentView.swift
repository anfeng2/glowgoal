//
//  ContentView.swift
//  glowgoal
//
//  Created by Angela Feng on 11/19/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Habit.name)
    private var habits: [Habit]
    
    init() {} 

    var body: some View {
        NavigationView {
            VStack {
                List(habits, id: \Habit.id) { habit in
                    HStack {
                        Text(habit.name)
                            .font(.headline)
                        Spacer()
                        Text("Reward: \(habit.reward)")
                            .foregroundColor(.gray)
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
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
