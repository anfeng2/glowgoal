//
//  StoreItem.swift
//  glowgoal
//
//  Created by Kaleen Chen on 12/4/24.
//

import SwiftData

@Model
class StoreItem {
    var imageName: String
    var cost: Int
    var isPurchased: Bool = false

    init(imageName: String, cost: Int) {
        self.imageName = imageName
        self.cost = cost
        self.isPurchased = false
    }
}
