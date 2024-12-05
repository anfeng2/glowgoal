//
//  StoreView.swift
//  glowgoal
//
//  Created by Kaleen Chen on 12/4/24.
//
import SwiftUI

struct StorefrontView: View {
    
    private let items: [StoreItem] = [
        StoreItem(imageName: "img9", cost: 5),
        StoreItem(imageName: "img1", cost: 10),
        StoreItem(imageName: "img2", cost: 15),
        StoreItem(imageName: "img3", cost: 20),
        StoreItem(imageName: "img4", cost: 25),
        StoreItem(imageName: "img5", cost: 30),
        StoreItem(imageName: "img7", cost: 35),
        StoreItem(imageName: "img8", cost: 40),
        StoreItem(imageName: "img6", cost: 45)
    ]

    var body: some View {
        NavigationView {
            VStack {
                // Display user's coins
                HStack {
                    Text("Coins: \(totalCoins)")
                        .font(.title2)
                        .padding()
                    Spacer()
                }
                
                // Store items grid
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 20) {
                        ForEach(items, id: \.imageName) { item in
                            VStack {
                                // Display item image
                                Image(item.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                // Display item cost
                                Text("\(item.cost) Coins")
                                    .font(.caption)
                                
                                // Purchase button
                                Button(action: {
                                    if totalCoins >= item.cost {
                                        totalCoins -= item.cost
                                        purchasedItems.append(item)
                                        
                                        // Save changes to the context after making updates
                                
                                    }
                                }) {
                                    Text("Buy")
                                        .font(.caption)
                                        .padding(5)
                                        .frame(maxWidth: .infinity)
                                        .background(
                                            totalCoins >= item.cost ? Color.green : Color.gray
                                        )
                                        .foregroundColor(.white)
                                        .cornerRadius(5)
                                }
                                .disabled(
                                    totalCoins < item.cost
                                )
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Storefront")
        }
    }

    
}
