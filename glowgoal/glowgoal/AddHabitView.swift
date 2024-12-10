//
//  AddHabitView.swift
//  glowgoal
//
//  Created by Angela Feng on 11/19/24.
//

import SwiftUI
import SwiftData

struct AddHabitView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) private var presentationMode
    @State private var habitName: String = ""
    @State private var selectedReward: Int? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.black)
                }
                Spacer()
                Text("Add Habit")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()

            // Text Box for Adding a Habit
            TextField("Enter habit...", text: $habitName)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(hex: "#FFCD43"), lineWidth: 2)
                )
                .padding(.horizontal)

            // Reward Section
            Text("Reward for 7-Day Streak:")
                .font(.headline)
                .padding(.horizontal)

            // Circular Options
            HStack(spacing: 20) {
                ForEach([5, 10, 15, 20], id: \.self) { number in
                    Button(action: {
                        selectedReward = number
                    }) {
                        Text("\(number)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(width: 50, height: 50)
                            .background(selectedReward == number ? Color(hex: "#FFCD43") : Color.white)
                            .foregroundColor(.black)
                            .overlay(
                                Circle()
                                    .stroke(Color(hex: "#FFCD43"), lineWidth: 2)
                            )
                            .clipShape(Circle())
                    }
                }
            }
            .padding(.horizontal)

            Spacer()

            // Add Button
            HStack {
                Spacer()
                Button(action: {
                    if let reward = selectedReward, !habitName.isEmpty {
                        let newHabit = Habit(name: habitName, reward: reward)
                        modelContext.insert(newHabit)
                        do {
                            try modelContext.save()
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("Failed to save new habit: \(error)")
                        }
                    
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Add")
                        .font(.headline)
                        .frame(width: UIScreen.main.bounds.width / 3, height: 50)
                        .background(Color(hex: "#FFCD43"))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
            .padding(.trailing)
        }
        .padding(.vertical)
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    AddHabitView()
        .modelContainer(for: Habit.self, inMemory: true)
}
