//
//  ContentView.swift
//  Looter
//
//  Created by Loris JACOB on 1/19/24.
//

import SwiftUI

enum LooterFeature {
    case loot
    case wishList
    case profile
}



struct ContentView: View {
    @State private var selectedFeature: LooterFeature = .loot
    var body: some View {
        
        TabView(selection: $selectedFeature) {
                    LootView()
                        .tabItem {
                            Label("Loot", systemImage: "bag.fill")
                        }
                        .tag(LooterFeature.loot)
                    WishListView()
                        .tabItem {
                            Label("Wishlist", systemImage: "heart.fill")
                        }
                        .tag(LooterFeature.wishList)
                    ProfileView()
                        .tabItem {
                            Label("Profil", systemImage: "person.fill")
                        }
                        .tag(LooterFeature.profile)
                }
        
        
      
    }
}

#Preview {
    ContentView()
}
