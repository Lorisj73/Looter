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
    @Binding var currentStep: Int
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
            Text(page.description).multilineTextAlignment(.center).font(.custom(
                "AmericanTypewriter",
                fixedSize: 15))
            Spacer()
            Button(action: {
                if page.buttonText == "Commencer"{
                    isOnboardingDone = true
                }
                else {
                    currentStep += 1
                }

            }, label: {
                Text(page.buttonText)
            })
            .buttonStyle(.borderedProminent)
            .tint(page.bgColor)
            .font(.custom(
                    "AmericanTypewriter",
                    fixedSize: 20))
            Spacer()
        }
    }
}

//#Preview {
//    OnBoardingPageView(page: Page(title: "Gerer ses loot", description: "Oui tu peux ajouter des loots c'est simpa (wow et diablo > aux autres jeux)", image: "skateboard", bgColor: Color.brown, buttonText: "Suivant", tag: 1), currentStep: 1)
//        .preferredColorScheme(.dark)
//}
//

