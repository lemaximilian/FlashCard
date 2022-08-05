//
//  CardView.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

struct FlashCardView: View {
    @EnvironmentObject var viewModel: FlashCardViewModel
    var flashCard: FlashCardModel.Playlist.FlashCard
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                    .fill()
                    .foregroundColor(.blue)
                if flashCard.isFlipped == false {
                    shape
                    Text(flashCard.frontContent)
                        .minimumScaleFactor(DrawingConstants.minimumScaleFactor)
                        .font(font(in: geometry.size))
                        .padding()
                } else {
                    shape
                    Text(flashCard.backContent)
                        .minimumScaleFactor(DrawingConstants.minimumScaleFactor)
                        .font(font(in: geometry.size))
                        .padding()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
}
