import Foundation
import SwiftUI
struct Task: Identifiable {
    let id = UUID()
    let name: String //name of task
    let icon: String // image of icon 
    var isCompleted: Bool //if completed
}

struct TaskRow: View {
    var task: Task
    
    var body: some View {
        HStack {
            Image(systemName: task.icon)
                .font(.title2)
            
            Text(task.name)
                .font(.headline)
                .padding(.leading, 10)
            
            Spacer()
            
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .font(.title2)
                .foregroundColor(task.isCompleted ? .green : .gray)
            
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}


