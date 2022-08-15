//
//  ShuffleView.swift
//  FlashCard
//
//  Created by Maximilian Le on 15.08.22.
//

import SwiftUI

struct ShuffleView: View {
    @EnvironmentObject var viewModel: FlashCardViewModel
    @State var selection: Int
    var playlist: FlashCardModel.Playlist
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(playlist.flashCards.shuffled()) { flashCard in // Lernkarte innerhalb der Playlist
                VStack {
                    FlashCardView(flashCard: flashCard)
                        .aspectRatio(1, contentMode: .fit)
                        .padding()
                        .onTapGesture {
                            viewModel.flipFlashCard(playlistID: playlist.id, flashCardID: flashCard.id)
                        }
                    VoiceOutputButton(flashCard: flashCard)
                }
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

