//
//  PageView.swift
//  FlashCard
//
//  Created by Maximilian Le on 07.08.22.
//

import SwiftUI

struct PageView: View {
    @EnvironmentObject var viewModel: FlashCardViewModel
    @State var selectedFlashCard: Int 
    var playlistID: Int
    
    var body: some View {
        TabView(selection: $selectedFlashCard) {
            ForEach(viewModel.playlists[playlistID].flashCards.reversed(), id: \.id) { flashCard in // Lernkarte innerhalb der Playlist
                FlashCardView(flashCard: flashCard.self)
                    .aspectRatio(1, contentMode: .fit)
                    .padding()
                    .onTapGesture {
                        viewModel.playlistID = playlistID
                        viewModel.flashCardID = flashCard.id
                        withAnimation {
//                            viewModel.editFlashCard()
                            viewModel.flipFlashCard()
                        }
                    }
                    .tag(flashCard.id)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

