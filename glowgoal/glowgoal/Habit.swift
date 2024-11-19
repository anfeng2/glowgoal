//
//  Habit.swift
//  glowgoal
//
//  Created by Angela Feng on 11/19/24.
//

import SwiftData

@Model
class Habit {
    var name: String
    var reward: Int
    var isCompleted: Bool //if completed
    var currentStreak: Int
    var dayUntilReward: Int

    init(name: String, reward: Int) {
        self.name = name
        self.reward = reward
        self.isCompleted = false
        self.currentStreak = 0
        self.dayUntilReward = 7
    }
}

