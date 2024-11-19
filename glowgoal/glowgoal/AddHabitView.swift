//
//  AddHabitView.swift
//  glowgoal
//
//  Created by Angela Feng on 11/19/24.
//

import SwiftUI
import SwiftData

struct AddHabitView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var habitName: String = ""
    @State private var selectedReward: Int? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Go back to the previous screen
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                Spacer()
                Text("Add Habit")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()

            // Text Box for Adding a Habit
            TextField("Enter habit name...", text: $habitName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
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
                            .background(selectedReward == number ? Color.blue : Color(hex: "#FFCD43"))
                            .foregroundColor(selectedReward == number ? .white : .black)
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
                    // Action for adding the habit
                }) {
                    Text("Add")
                        .font(.headline)
                        .frame(width: UIScreen.main.bounds.width / 3, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
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
        .modelContainer(for: Item.self, inMemory: true)
}
