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
    var playlistIndex: Int
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Button(action: {
                    
                }) {
                    Image(systemName: "pencil")
                }
                Spacer()
                .foregroundColor(.blue)
                Button(action: {
                    viewModel.flashCardIndex = viewModel.getFlashCardIndex(selectedFlashCard)!
                    viewModel.deleteFlashCard()
                }) {
                    Image(systemName: "trash")
                }
                .foregroundColor(.red)
            }
            .padding(.horizontal)
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
        }
    }
}

