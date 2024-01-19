//
//  ContentView.swift
//  Looter
//
//  Created by Loris JACOB on 1/19/24.
//

import SwiftUI



class Inventory: ObservableObject {
    @Published var loot: [LootItem] = exampleLootItems
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()
    
    @State var showAddItemView = false

    var body: some View {
        NavigationStack {
            List {
//                Button(action: {
//                    let newItem = LootItem(quantity: 1, name: "Épée de Feu", type: .fire, rarity: .rare, attaStrength: 45, game: Game(name: "Skyrim", genre: .rpg, coverName: nil))
//                    inventory.addItem(item: newItem)
//                }, label: {
//                    Text("Ajouter un item")
//                })
                ForEach(inventory.loot) { item in
                    NavigationLink {
                        LootDetailView(item: item) // On passe directement l'item à la vue
                    } label: {
                        HStack {
                            if let coverName = item.game.coverName, let image = UIImage(named: coverName) {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            }else {
                                Image(systemName: "rectangle.slash")
                                    .resizable()
                                    .frame(width: 50, height: 58)
                                    .cornerRadius(4)
                                    .background(Color(.gray).gradient.opacity(0.4))
                            }
                            VStack() {
                                HStack {
                                    Circle()
                                        .fill(item.rarity.color())
                                        .frame(width: 10, height: 10)
                                    Text("\(item.name) \(item.type.rawValue)").font(.headline)
                                }
                                if let strength = item.attaStrength {
                                    Text("Degats d'attaque: \(strength)")
                                }
                                
                            }
                        }
                    }
                    
                }
            }
            .sheet(isPresented: $showAddItemView, content: {
                    AddItemView()
                    .environmentObject(inventory)
                })
            .navigationBarTitle("Loot") // Notre titre de page, choisissez le titre que vous voulez
                .toolbar(content: { // La barre d'outil de notre page
                    ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                        Button(action: {
                            showAddItemView.toggle() // L'action de notre bouton
                        }, label: {
                            Image(systemName: "plus.circle.fill")
                        })
                    }
                })
        }
    }
}

#Preview {
    ContentView()
}
