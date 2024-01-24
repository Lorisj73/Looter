//
//  OnBoardingView.swift
//  Looter
//
//  Created by Loris JACOB on 1/24/24.
//

import SwiftUI


struct Page: Identifiable {
    var id: UUID = UUID()
    var title: String
    var description: String
    var image: String
    var bgColor: Color
    var buttonText: String
}

let pages: [Page] = [
    Page(title: "Gerer ses loot", description: "Oui tu peux ajouter des loots c'est simpa (wow et diablo > aux autres jeux)", image: "skateboard", bgColor: Color.cyan, buttonText: "Suivant"),
    Page(title: "Votre wishList", description: "Créer une liste de souhaits (c'est faux on l'as pas dev)", image: "list.bullet", bgColor: Color.orange, buttonText: "Suivant"),
    Page(title: "En un coup d'oeil", description: "Ca va vite ", image: "car.circle.fill", bgColor: Color.green, buttonText: "Commencer")
]

struct OnBoardingView: View {
    var body: some View {
        TabView{
            ForEach (pages){ page in
                OnBoardingPageView(page: page)
            }
        }.tabViewStyle(PageTabViewStyle())
            .padding(.vertical, 20)
    }
}

#Preview {
    OnBoardingView()
}
