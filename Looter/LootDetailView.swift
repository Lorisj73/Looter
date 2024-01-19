import SwiftUI

struct LootDetailView: View {
    let item: LootItem
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            VStack{
                Text(item.type.rawValue)
                    .font(.largeTitle)
                    .padding(20)
                    .background(
                        // Appliquez le gradient ici
                        RoundedRectangle(cornerRadius: 20)
                            .fill(item.rarity.color().gradient)
                            .shadow(color: item.rarity.color(), radius: 50) // Ajustez le rayon et les offsets pour voir l'ombre
                    )
                Text(item.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .foregroundColor(item.rarity.color())
                if item.rarity == .unique {
                    Spacer()
                    Text("Item Unique 🏆")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(item.rarity.color().gradient)
                        .cornerRadius(10)
                    
                    
                }
            }.padding()
            List{
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
    }
}

struct LootDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LootDetailView(item: LootItem(quantity: 2, name: "Épée du Désespoir", type: .dagger, rarity: .unique, attaStrength: 4, game: availableGames[5]))
    }
}
