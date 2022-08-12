//
//  FlashCardView.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

struct PlaylistView: View { // Playlist-View, zeigt alle Lernkarten der Playlist in einem Raster an
    @EnvironmentObject var viewModel: FlashCardViewModel
    var playlistID: UUID
    @State var alertShown = false
    var playlistName: String
    let alertTitle = "Achtung"
    let alertMessage = "Möchten Sie diese Playlist wirklich löschen?"
    let alertButtonTextConfirm = "Bestätigen"
    let alertButtonTextCancel = "Abbrechen"
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: DrawingConstants.gridItemSize))]) { // Lernkarten-Raster
                AddFlashCardView(playlistIndex: viewModel.getPlaylistIndex(playlistID)!)
                ForEach(viewModel.flashCards.reversed()) { flashCard in // Lernkarte innerhalb der Playlist
                    NavigationLink(destination: PageView(selectedFlashCard: flashCard.id, playlistIndex: viewModel.getPlaylistIndex(playlistID)!)) {
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
//            .onAppear {
//                viewModel.playlistIndex = playlistIndex
//            }
        .toolbar {
            Button(action: {
                alertShown.toggle()
            }) {
                Image(systemName: "trash")
            }
            .alert(Text(alertTitle), isPresented: $alertShown, actions: { // Alert bei fehlendem Playlistnamen
                Button(alertButtonTextCancel) { }
                Button(alertButtonTextConfirm) {
                    print(viewModel.getPlaylistIndex(playlistID))
                    viewModel.deletePlaylist(playlistID)
                }
            }, message: {
                Text(alertMessage)
            })
            .foregroundColor(.red)
        }
    }
}
