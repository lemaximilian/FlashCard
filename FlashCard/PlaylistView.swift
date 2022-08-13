//
//  FlashCardView.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

struct PlaylistView: View { // Playlist-View, zeigt alle Lernkarten der Playlist in einem Raster an
    @EnvironmentObject var viewModel: FlashCardViewModel
    @State var alertShown = false
    var playlist: FlashCardModel.Playlist
    let alertTitle = "Achtung"
    let alertMessage = "Möchten Sie diese Playlist wirklich löschen?"
    let alertButtonTextConfirm = "Bestätigen"
    let alertButtonTextCancel = "Abbrechen"
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: DrawingConstants.gridItemSize))]) { // Lernkarten-Raster
                AddFlashCardView(playlist: playlist)
                ForEach(playlist.flashCards.reversed()) { flashCard in // Lernkarte innerhalb der Playlist
                    NavigationLink(destination: PageView(selection: flashCard.id, flashCard: flashCard, playlist: playlist)) {
                        FlashCardView(flashCard: flashCard)
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
        .navigationTitle(playlist.name)
        .padding()
        .toolbar {
            Button(action: {
                alertShown.toggle()
            }) {
                Image(systemName: "trash")
            }
            .alert(Text(alertTitle), isPresented: $alertShown, actions: { // Alert bei fehlendem Playlistnamen
                Button(alertButtonTextCancel) { }
                Button(alertButtonTextConfirm) {
                    viewModel.deletePlaylist(playlist.id)
                }
            }, message: {
                Text(alertMessage)
            })
            .foregroundColor(.red)
        }
    }
}
