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

    init(name: String, reward: Int) {
        self.name = name
        self.reward = reward
    }
}

