//
//  Item.swift
//  glowgoal
//
//  Created by Angela Feng on 11/19/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
