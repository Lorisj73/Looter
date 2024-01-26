//
//  AddItemView.swift
//  Looter
//
//  Created by Loris JACOB on 1/19/24.
//

import SwiftUI



struct AddItemView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var error: Bool = false
    @State var id: UUID?
    @State var name: String = ""
    @State var rarity: Rarity = Rarity.common
    @State var game: Game = Game.emptyGame
    @State var quantity: Int = 0
    @State var type : ItemType = ItemType.unknowed
    @State var hasAttackStrength: Bool = false
    @State var attackStrength: Int? = nil
    
    @State var isEditing: Bool = false
    
    @EnvironmentObject var inventory : Inventory
    
    
    var body: some View {
        Form {
            Section {
                TextField("Nom de l'objet", text: $name)
                Picker("Rarete", selection: $rarity) {
                    ForEach(Rarity.allCases ,id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
                .alert(isPresented: $error, content: {
                    Alert(
                        title: Text("Erreur de format"),
                        message: Text("Attention: Le nom de l'item dois avoir au moins 3 caractères, le jeu ne peut pas être emptyGame et le type ne peut pas être unknown ")
                    )
                }
                )
            }
            
            Section {
                Picker("Jeu", selection: $game) {
                    Text(Game.emptyGame.name).tag(Game.emptyGame)
                    ForEach(availableGames) { game in
                        Text(game.name)
                            .tag(game)
                    }
                }
                Stepper("Combien: \(quantity)", value: $quantity)
            }
            
            Section {
                HStack{
                    Text(verbatim: "Type")
                    Spacer()
                    Text(verbatim: type.rawValue)
                }
                Picker("Type \(type.rawValue)", selection: $type) {
                    ForEach(ItemType.allCases ,id: \.self) { type in
                        Text(String(describing: type.rawValue).capitalized)
                    }
                }.pickerStyle(.palette)
            }
            
            Section {
                Toggle(isOn: $hasAttackStrength) {
                    Text("Item d'attaque ?")
                }
                
                if hasAttackStrength {
                    Stepper("Force d'attaque: \(attackStrength ?? 0)", onIncrement: {
                        self.attackStrength = (self.attackStrength ?? 0) + 1
                    }, onDecrement: {
                        self.attackStrength = max((self.attackStrength ?? 0) - 1, 0)
                    })
                }
            }
            Button(action: {
                if name.isEmpty {
                    error = true
                    return
                }
                else if name.count < 3 {
                    error = true
                    return
                }
                else if game == Game.emptyGame {
                    error = true
                    return
                }
                else if type == ItemType.unknowed {
                    error = true
                    return
                }
                
                if let id {
                    let newItem = LootItem(id: id ,quantity: quantity, name: name, type: type, rarity: rarity, attaStrength: hasAttackStrength ? attackStrength : nil, game: game)
                        inventory.updateItem(item: newItem)
                }
                else {
                    let newItem = LootItem(quantity: quantity, name: name, type: type, rarity: rarity, attaStrength: hasAttackStrength ? attackStrength : nil, game: game)
                    inventory.addItem(item: newItem)
                }
                dismiss()
                
                
            }, label: {
                if isEditing{
                    Text("Editer")
                }
                else {
                    Text("Ajouter")
                }
            })
            
        }
    }
}

#Preview {
    
    AddItemView()
}
