//
//  OnBoardingPageView.swift
//  Looter
//
//  Created by Loris JACOB on 1/24/24.
//

import SwiftUI



struct OnBoardingPageView: View {
    let page: Page
    @AppStorage("isOnboardingDone") var isOnboardingDone: Bool?
    var body: some View {
        VStack{
            Spacer()
            Text(page.title)
                .font(.custom(
                        "AmericanTypewriter",
                        fixedSize: 36))
                .bold()
                
            Spacer()
            Image(systemName: page.image)
                .frame(width: 100, height: 100)
                .font(.system(size: 84))
                .padding()
                .foregroundColor(.white)
                .background(page.bgColor)
                .clipShape(Circle())
            Spacer()
            Text(page.description).multilineTextAlignment(.center)
            Spacer()
            Button(action: {
                if page.buttonText == "Commencer"{
                    isOnboardingDone = true
                }
                else {
                    // Faut passer à la page suivante
                }

            }, label: {
                Text(page.buttonText)
            })
            .buttonStyle(.borderedProminent)
            .background(page.bgColor)
            Spacer()
        }
    }
}

#Preview {
    OnBoardingPageView(page: Page(title: "Gerer ses loot", description: "Oui tu peux ajouter des loots c'est simpa (wow et diablo > aux autres jeux)", image: "skateboard", bgColor: Color.cyan, buttonText: "Suivant"))
}
