//
//  AddItemView.swift
//  Looter
//
//  Created by Loris JACOB on 1/19/24.
//

import SwiftUI



struct AddItemView: View {
    @Environment(\.dismiss) private var dismiss
    @State var name: String = ""
    @State var rarity: Rarity = Rarity.common
    @State var game: Game = Game.emptyGame
    @State var quantity: Int = 0
    @State var type : ItemType = ItemType.unknowed
    @State private var hasAttackStrength: Bool = false
    @State private var attackStrength: Int? = nil
    
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
                }
                
                Section {
                    Picker("Jeu", selection: $game) {
                        ForEach(0..<availableGames.count, id: \.self) { index in
                            Text(availableGames[index].name).tag(availableGames[index].id)
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

                    let newItem = LootItem(quantity: quantity, name: name, type: type, rarity: rarity, attaStrength: hasAttackStrength ? attackStrength : nil, game: game)
                    inventory.addItem(item: newItem)
                    dismiss()
                }, label: {
                    Text("Ajouter")
                })

            }
        }
}

#Preview {
    AddItemView()
}
