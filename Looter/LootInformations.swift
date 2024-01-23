//
//  LootInformations.swift
//  Looter
//
//  Created by Loris JACOB on 1/23/24.
//

import SwiftUI

struct LootInformations: View {
    let item: LootItem
    var body: some View {
        Section{
            HStack{
                if let coverName = item.game.coverName, let image = UIImage(named: coverName) {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 50, height: 58)
                        .cornerRadius(4)
                } else {
                    Image(systemName: "rectangle.slash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 58)
                        .cornerRadius(4)
                        .background(Color(.gray).gradient.opacity(0.4))
                        .opacity(0.4)
                }
                Text(item.game.name).bold()
            }
            Text("In-game: \(item.name)")
            Text("Puissance (ATQ): \(item.attaStrength ?? 0)")
            Text("Possédé(s): \(item.quantity)")
            Text("Rarete: \(item.rarity.rawValue)")
        }
    header:{
        Text(verbatim: "Informations")
    }
    }
}

//#Preview {
//    LootInformations()
//}
