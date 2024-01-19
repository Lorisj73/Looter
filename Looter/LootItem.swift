//
//  LootItem.swift
//  Looter
//
//  Created by Loris JACOB on 1/19/24.
//

import Foundation
import SwiftUI

enum ItemType:String, CaseIterable {
    case magic = "⭐️"
    case fire = "🔥"
    case ice = "❄️"
    case wind = "💨"
    case poison = "☠️"
    case thunder = "⚡️"
    case dagger = "🗡️"
    case shield = "🛡️"
    case bow = "🏹"
    case ring = "💍"
    case unknowed = "🎲"
}


enum Rarity:String, CaseIterable {
    case common = "common"
    case uncommon = "uncommon"
    case rare = "rare"
    case epic = "epic"
    case legendary = "legendary"
    case unique = "unique"
    
    func color() -> Color {
            switch self {
            case .common:
                return Color.gray
            case .uncommon:
                return Color.green
            case .rare:
                return Color.blue
            case .epic:
                return Color.purple
            case .legendary:
                return Color.orange
            case .unique:
                return Color.red
            }
        }
}




struct LootItem: Identifiable {
    var id = UUID()
    var quantity: Int = 1
    var name : String
    var type: ItemType
    var rarity: Rarity
    var attaStrength: Int?
    var game: Game
}

let exampleLootItems = [
    LootItem(quantity: 2, name: "Flame Sword", type: .fire, rarity: .rare, attaStrength: 50, game: availableGames[1]),
    LootItem(quantity: 1, name: "Ice Wand", type: .ice, rarity: .epic, attaStrength: 70, game: availableGames[0]),
    LootItem(quantity: 3, name: "Thunder Dagger", type: .thunder, rarity: .uncommon, attaStrength: 30, game: availableGames[4]),
    LootItem(quantity: 1, name: "Wind Bow", type: .wind, rarity: .legendary, attaStrength: 90, game: availableGames[2]),
    LootItem(quantity: 2, name: "Poison Shield", type: .poison, rarity: .common, attaStrength: 20, game: availableGames[3]),
    LootItem(quantity: 1, name: "Mystic Ring", type: .magic, rarity: .unique, attaStrength: 100, game: availableGames[1]),
    LootItem(quantity: 3, name: "Un jeu sans image", type: .magic, rarity: .unique, attaStrength: 100, game: availableGames[5])
]



