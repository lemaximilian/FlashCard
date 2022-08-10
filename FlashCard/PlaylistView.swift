//
//  FlashCardView.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

struct PlaylistView: View { // Playlist-View, zeigt alle Lernkarten der Playlist in einem Raster an
    @EnvironmentObject var viewModel: FlashCardViewModel
    var playlistName: String
    var playlistIndex: Int
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: DrawingConstants.gridItemSize))]) { // Lernkarten-Raster
                    AddFlashCardView(playlistIndex: playlistIndex)
                    ForEach(viewModel.playlists[playlistIndex].flashCards.reversed()) { flashCard in // Lernkarte innerhalb der Playlist
                        NavigationLink(destination: PageView(selectedFlashCard: flashCard.id, playlistIndex: playlistIndex)) {
                            FlashCardView(flashCard: flashCard.self)
                                .aspectRatio(1, contentMode: .fit)
                                .transition(.move(edge: .leading))
                        }
                        .buttonStyle(.plain)
//                                FlashCardView(flashCard: flashCard.self)
//                                    .aspectRatio(1, contentMode: .fit)
//                                    .onTapGesture {
//                                        viewModel.playlistID = playlistID
//                                        viewModel.flashCardID = flashCard.id
//                                        withAnimation {
//                                            viewModel.editFlashCard()
//                                        viewModel.flipFlashCard()
//                                        }
                    }
                }
            }
            .navigationTitle(playlistName)
            .padding()
        }
    }
}
