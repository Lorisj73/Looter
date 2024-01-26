//
//  LootView.swift
//  Looter
//
//  Created by Loris JACOB on 1/26/24.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var loot: [LootItem] = exampleLootItems
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
    
    func updateItem(item: LootItem) {
        if let index = loot.firstIndex(where: { $0.id == item.id }) {
            loot[index] = item
        }
    }
}
struct LootView: View {
    @Environment(\.editMode) private var editMode
    @StateObject var inventory = Inventory()
    @AppStorage("isOnboardingDone") var isOnboardingDone: Bool = false
    @State var showAddItemView = false
    
    
    var body: some View {
        NavigationStack {
            Button(action: {
                isOnboardingDone = false
            }, label: {
                Image(systemName: "plus.circle.fill")
            })
            List {
                ForEach(inventory.loot) { item in
                    NavigationLink {
                        LootDetailView(item: item)
                            .environmentObject(inventory)// On passe directement l'item à la vue
                    } label: {
                        ExtractedView(item: item)
                    }
                    
                }
                .onDelete(perform: { indexSet in
                    inventory.loot.remove(atOffsets: indexSet)
                })
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
            .toolbar { // Assumes embedding this view in a NavigationView.
                    EditButton()
                }
        }
    }
}

#Preview {
    LootView()
}
