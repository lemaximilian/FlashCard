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
    var playlistID: Int
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    Text(playlistName)
                        .font(.largeTitle)
                        .bold()
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: DrawingConstants.gridItemSize))]) { // Lernkarten-Raster
                        AddFlashCardView(playlistID: playlistID)
                        ForEach(viewModel.playlists[playlistID].flashCards, id: \.id) { flashCard in // Lernkarte innerhalb der Playlist
                            FlashCardView(flashCard: flashCard.self)
                                .aspectRatio(1, contentMode: .fit)
                                .onTapGesture {
                                    viewModel.playlistID = playlistID
                                    viewModel.flashCardID = flashCard.id
                                    withAnimation {
//                                        viewModel.editFlashCard()
                                        viewModel.flipFlashCard()
                                    }
                                }
                        }
                    }
                }
                .padding()
            }
        }
    }
}
