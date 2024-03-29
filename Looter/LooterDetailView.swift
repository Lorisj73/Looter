import SwiftUI

struct LootDetailView: View {
    let item: LootItem
    
    
    @State private var animationAmount = 0.0
    @State private var scaleUnique = 0.0
    @State private var shadowRadius: CGFloat = 0 // Variable d'état pour l'animation de l'ombre
    @State private var overlayValue = 0.0
    @State var showAddItemView = false
    
    @EnvironmentObject var inventory : Inventory
    
    var body: some View {
        NavigationStack{
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
                    LootInformations(item: item)
                    
                }
            }
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView(
                    error: false,
                    id: item.id,
                    name: item.name,
                    rarity: item.rarity,
                    game: item.game,
                    quantity: item.quantity,
                    type: item.type,
                    hasAttackStrength: (item.attaStrength != nil),
                    attackStrength: item.attaStrength,
                    isEditing: true
                )
                    .environmentObject(inventory)

            })
            .toolbar(content: { // La barre d'outil de notre page
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Button(action: {
                        showAddItemView.toggle() // L'action de notre bouton
                    }, label: {
                        HStack{
                            Image(systemName: "pencil")
                            Text("Edit")
                        }
                        
                    })
                    
                }
            })
        }
        
    }
}

#Preview {

    LootDetailView(item: LootItem(quantity: 2, name: "Épée du Désespoir", type: .dagger, rarity: .unique, attaStrength: 4, game: availableGames[5]))
}

