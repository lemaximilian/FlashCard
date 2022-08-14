//
//  CardView.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

struct FlashCardView: View { // Lernkarten-View, zeigt die Vorderseite bzw. die Rückseite der Lernkarte
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
                            .font(font(in: geometry.size))
                            .minimumScaleFactor(DrawingConstants.minimumScaleFactor)
                            .padding()
                } else {
                        shape
                        Text(flashCard.backContent) // Inhalt Rückseite
                            .font(font(in: geometry.size))
                            .minimumScaleFactor(DrawingConstants.minimumScaleFactor)
                            .padding()
                            .rotation3DEffect(Angle(degrees: flashCard.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                }
            }
            .rotation3DEffect(Angle(degrees: flashCard.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        }
    }
    
    private func font(in size: CGSize) -> Font { // Funktion für Schriftgröße
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
}
