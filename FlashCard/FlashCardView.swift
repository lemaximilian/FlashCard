//
//  CardView.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

struct FlashCardView: View { // Lernkarten-View, zeigt die Vorderseite bzw. die Rückseite der Lernkarte
    @EnvironmentObject var viewModel: FlashCardViewModel
    @State var flashCard: FlashCardModel.FlashCard
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius) // Lernkarte
                    .fill()
                    .foregroundColor(.blue)
                if flashCard.isFlipped == false {
                        shape
                        TextEditor(text: $flashCard.frontContent) // Inhalt Vorderseite
                            .minimumScaleFactor(DrawingConstants.minimumScaleFactor)
                            .font(font(in: geometry.size))
                            .multilineTextAlignment(.center)
                            .padding()
                } else {
                        shape
                        TextEditor(text: $flashCard.backContent) // Inhalt Rückseite
                            .minimumScaleFactor(DrawingConstants.minimumScaleFactor)
                            .font(font(in: geometry.size))
                            .multilineTextAlignment(.center)
                            .padding()
                            .rotation3DEffect(Angle(degrees: flashCard.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                }
            }
            .onAppear {
                UITextView.appearance().backgroundColor = .clear
            }
//            .scaleEffect(flashCard.editMode ? 2 : 1)
//            .position(x: flashCard.editMode ? geometry.size.width * -0.05 : geometry.size.width * 0.5, y: flashCard.editMode ? geometry.size.height : geometry.size.height * 0.5)
            .rotation3DEffect(Angle(degrees: flashCard.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        }
    }
    
    private func font(in size: CGSize) -> Font { // Funktion für Schriftgröße
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
}
