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
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: DrawingConstants.gridItemSize))]) { // Lernkarten-Raster
                AddFlashCardView(playlist: playlist)
                ForEach(playlist.flashCards.reversed()) { flashCard in // Lernkarte innerhalb der Playlist
                    NavigationLink(destination: PageView(selection: flashCard.id, playlist: playlist)) {
                        FlashCardView(flashCard: flashCard)
                            .aspectRatio(1, contentMode: .fit)
                            .transition(.move(edge: .leading))
                            .animation(.easeInOut, value: playlist.flashCards.count)
                    }
                    .buttonStyle(.plain)
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
            .alert(Text("Achtung"), isPresented: $alertShown, actions: { // Alert bei fehlendem Playlistnamen
                Button("Abbrechen") { }
                Button("Bestätigen") {
                    viewModel.deletePlaylist(playlist.id)
                }
            }, message: {
                Text("Möchten Sie diese Playlist wirklich löschen?")
            })
            .foregroundColor(.red)
        }
    }
}
