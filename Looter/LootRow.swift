//
//  LootRow.swift
//  Looter
//
//  Created by Loris JACOB on 1/23/24.
//

import SwiftUI

struct ExtractedView: View {
    let item: LootItem
    var body: some View {
        VStack {
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
//#Preview {
//    ExtractedView(item: )
//}
