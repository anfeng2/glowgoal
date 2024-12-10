//
//  CollectionsView.swift
//  glowgoal
//
//  Created by Kaleen Chen on 12/10/24.
//

import SwiftUI
import _SwiftData_SwiftUI

struct CollectionView: View {
    @Query(filter: #Predicate { (item: StoreItem) in item.isPurchased == true }) private var purchasedItems: [StoreItem]
    
    var body: some View {
        NavigationView {
            VStack {
                if purchasedItems.isEmpty {
                    Text("No items in your collection.")
                        .font(.headline)
                } else {
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 20) {
                            ForEach(purchasedItems, id: \.id) { item in
                                VStack {
                                    Image(item.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)

                                    Text("\(item.cost) Coins")
                                        .font(.caption)
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("My Collection")
    }
}
