//
//  WelcomeView.swift
//  FlashCard
//
//  Created by Maximilian Le on 07.08.22.
//

import SwiftUI

struct WelcomeView: View { // Willkommensnachricht
    @EnvironmentObject var viewModel: FlashCardViewModel
    let welcomeTitle = "Willkommen bei FlashCard!"
    let welcomeText = "Erstellen Sie mit FlashCard grandiose Lernkarten um ihr Lernerlebnis zu verbessern! Legen Sie einfach eine neue Playlist an und fügen Sie Lernkarten hinzu."
    let buttonLabel = "Verstanden!"
    
    var body: some View {
        VStack {
            Spacer()
            Text(welcomeTitle)
                .font(.largeTitle)
                .bold()
                .padding()
            Text(welcomeText)
                .font(.subheadline)
            Spacer()
            Button(action: {
                viewModel.welcomeMessageShown.toggle()
            }) {
                Text(buttonLabel)
                    .padding(10)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.regular)
            .padding()
            .interactiveDismissDisabled()
        }
    }
}


