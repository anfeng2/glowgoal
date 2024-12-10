//
//  CollectionsView.swift
//  glowgoal
//
//  Created by Kaleen Chen on 12/10/24.
//

import SwiftUI

struct CollectionView: View {
    let purchasedItems: [StoreItem]
    
    var body: some View {
        NavigationView {
            VStack {
                if purchasedItems.isEmpty {
                    Text("You haven't purchased any items yet.")
                        .font(.headline)
                        .padding()
                } else {
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 20) {
                            ForEach(purchasedItems.indices, id: \.self) { index in
                                let item = purchasedItems[index]
                                VStack {
                                    Image(item.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    Text("\(item.cost) Coins")
                                        .font(.caption)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("My Collection")
        }
    }
}
