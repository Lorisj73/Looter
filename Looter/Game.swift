//
//  Game.swift
//  Looter
//
//  Created by Loris JACOB on 1/19/24.
//

import Foundation

enum GameGenre {
    case mmorpg, rpg, looter, fps, tps, strategy, unset
}

struct Game: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
    let genre: GameGenre
    let coverName : String?
    
    static var emptyGame = Game(name: "", genre: .unset, coverName: nil)
}

// Hesitez pas mettre vos propres jeux dans la liste
let availableGames = [
    Game(name: "Elden Ring", genre: .rpg, coverName: "EldenRing.png"),
    Game(name: "Skyrim", genre: .rpg, coverName: "Skyrim.png"),
    Game(name: "WoW", genre: .mmorpg, coverName: "Wow.png"),
    Game(name: "CS:GO", genre: .fps, coverName: "DiabloIV.png"),
    Game(name: "Diablo IV", genre: .looter, coverName: "CSGO.png"),
    Game(name: "Overwatch", genre: .looter, coverName: nil)
]
