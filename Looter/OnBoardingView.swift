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
    var tag: Int
}

let pages: [Page] = [
    Page(title: "Gerer ses loot", description: "Oui tu peux ajouter des loots c'est simpa (wow et diablo > aux autres jeux)", image: "skateboard", bgColor: Color.cyan, buttonText: "Suivant", tag: 1),
    Page(title: "Votre wishList", description: "Créer une liste de souhaits (c'est faux on l'as pas dev)", image: "list.bullet", bgColor: Color.orange, buttonText: "Suivant", tag: 2),
    Page(title: "En un coup d'oeil", description: "Ca va vite ", image: "car.circle.fill", bgColor: Color.green, buttonText: "Commencer", tag: 3)
]

struct OnBoardingView: View {
    @State var currentStep: Int = 1
    var body: some View {
        TabView(selection: $currentStep){
            ForEach (pages){ page in
                OnBoardingPageView(page: page, currentStep: $currentStep)
                    .tag(page.tag)
            }
        }.tabViewStyle(PageTabViewStyle())
            .padding(.vertical, 20)
    }
}

#Preview {
    OnBoardingView()
}
