//
//  PageView.swift
//  FlashCard
//
//  Created by Maximilian Le on 07.08.22.
//

import SwiftUI

struct PageView: View {
    @EnvironmentObject var viewModel: FlashCardViewModel
    @State var selectedFlashCard: UUID
    @State var alertShown = false
    var playlistIndex: Int
    let alertTitle = "Achtung"
    let alertMessage = "Möchten Sie diese FlashCard wirklich löschen?"
    let alertButtonTextConfirm = "Bestätigen"
    let alertButtonTextCancel = "Abbrechen"
    
    var body: some View {
        TabView(selection: $selectedFlashCard) {
            ForEach(viewModel.playlists[playlistIndex].flashCards.reversed()) { flashCard in // Lernkarte innerhalb der Playlist
                FlashCardView(flashCard: flashCard.self)
                    .aspectRatio(1, contentMode: .fit)
                    .padding()
                    .onTapGesture {
                        viewModel.playlistIndex = playlistIndex
                        viewModel.flashCardIndex = viewModel.getFlashCardIndex(flashCard.id)!
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
        .toolbar {
            HStack {
                Button(action: {
                    
                }) {
                    Image(systemName: "pencil")
                }
                .foregroundColor(.blue)
                Button(action: {
                    alertShown.toggle()
                }) {
                    Image(systemName: "trash")
                }
                .alert(Text(alertTitle), isPresented: $alertShown, actions: { // Alert bei fehlendem Playlistnamen
                    Button(alertButtonTextCancel) { }
                    Button(alertButtonTextConfirm) {
                        viewModel.flashCardIndex = viewModel.getFlashCardIndex(selectedFlashCard)!
                        viewModel.deleteFlashCard()
                    }
                }, message: {
                    Text(alertMessage)
                })
                .foregroundColor(.red)
            }
        }
    }
}

