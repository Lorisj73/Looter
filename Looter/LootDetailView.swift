import SwiftUI

struct LootDetailView: View {
    let item: LootItem
    
    
    @State private var animationAmount = 0.0
    @State private var scaleUnique = 0.0
    @State private var shadowRadius: CGFloat = 0 // Variable d'état pour l'animation de l'ombre
    @State private var overlayValue = 0.0
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            VStack{
                Text(item.type.rawValue)
                            .font(.largeTitle)
                            .padding(20)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(item.rarity.color().gradient)
                                    .shadow(color: item.rarity.color(), radius: shadowRadius)
                            )
                            .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 1, z: 0))
                            .onAppear {
                                Task{
                                    try? await Task.sleep(nanoseconds: 400_000_000)
                                    // Rotation animation
                                    withAnimation(.spring(duration: 1)) {
                                        animationAmount = 720
                                    }
                                    withAnimation(.bouncy(duration: 1) .delay(1)) {
                                        shadowRadius = 50
                                    }
                                }
                            }
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
                        .scaleEffect(scaleUnique)
                        .onAppear{
                            Task{
                                try? await Task.sleep(nanoseconds: 400_000_000)
                                withAnimation(.easeIn(duration: 0.3)){
                                    self.scaleUnique = 1
                                }
                            }

                        }


                    
                    
                    
                    
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
