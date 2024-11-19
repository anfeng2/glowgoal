//
//  AddHabitView.swift
//  glowgoal
//
//  Created by Angela Feng on 11/19/24.
//

import SwiftUI
import SwiftData

struct AddHabit: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        VStack {
            Text("Add Habit")
        }
        .navigationTitle("Add Habit")
        .navigationBarBackButtonHidden(false)
        
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    AddHabit()
        .modelContainer(for: Item.self, inMemory: true)
}

