//
//  CardView.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

struct FlashCardView: View { // Lernkarten-View, zeigt die Vorderseite bzw. die Rückseite der Lernkarte
    @EnvironmentObject var viewModel: FlashCardViewModel
    var flashCard: FlashCardModel.FlashCard
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius) // Lernkarte
                    .fill()
                    .foregroundColor(.blue)
                if flashCard.isFlipped == false {
                    shape
                    Text(flashCard.frontContent) // Inhalt Vorderseite
                        .minimumScaleFactor(DrawingConstants.minimumScaleFactor)
                        .font(font(in: geometry.size))
                        .padding()
                } else {
                    shape
                    Text(flashCard.backContent) // Inhalt Rückseite
                        .minimumScaleFactor(DrawingConstants.minimumScaleFactor)
                        .font(font(in: geometry.size))
                        .padding()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font { // Funktion für Schriftgröße
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
}
