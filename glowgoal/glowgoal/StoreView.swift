//
//  StoreView.swift
//  glowgoal
//
//  Created by Kaleen Chen on 12/4/24.


import SwiftUI
import _SwiftData_SwiftUI

struct StorefrontView: View {
    @Environment(\.modelContext) private var context

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
                HeaderView(totalCoins: totalCoins)

                ItemGridView(
                    items: items,
                    totalCoins: totalCoins
                ) { item in
                    purchaseItem(item)
                }
            }
            .navigationTitle("Storefront")
        }
    }

    private func purchaseItem(_ item: StoreItem) {
        guard totalCoins >= item.cost else { return }
        
        totalCoins -= item.cost
        var purchasedItem = item
        purchasedItem.isPurchased = true

        purchasedItems.append(purchasedItem)

        do {
            context.insert(purchasedItem)
            try context.save()
        } catch {
            print("Purchase failed: \(error)")
        }
    }
}

// MARK: - Subviews

struct HeaderView: View {
    var totalCoins: Int

    var body: some View {
        HStack {
            Text("Coins: \(totalCoins)")
                .font(.title2)
                .padding()

            Spacer()

            NavigationLink(destination: CollectionView()) {
                Text("My Collection")
                    .font(.headline)
                    .padding(8)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

struct ItemGridView: View {
    let items: [StoreItem]
    var totalCoins: Int
    var purchaseAction: (StoreItem) -> Void

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 20) {
                ForEach(items, id: \.id) { item in
                    VStack {
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))

                        Text("\(item.cost) Coins")
                            .font(.caption)

                        BuyButton(item: item, totalCoins: totalCoins, purchaseAction: purchaseAction)
                    }
                }
            }
            .padding()
        }
    }
}

struct BuyButton: View {
    let item: StoreItem
    var totalCoins: Int
    var purchaseAction: (StoreItem) -> Void

    var body: some View {
        Button(action: {
            purchaseAction(item)
        }) {
            Text("Buy")
                .font(.caption)
                .padding(5)
                .frame(maxWidth: .infinity)
                .background(totalCoins >= item.cost ? Color.green : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(5)
        }
        .disabled(totalCoins < item.cost)
    }
}
