//
//  FlashCardView.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

struct PlaylistView: View {
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
//                    Button(action: {
//                        viewModel.addFlashCard()
//                    }) {
//                        Text("FlashCard erstellen")
//                    }
//                    .buttonStyle(.borderedProminent)
//                    .controlSize(.regular)
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: DrawingConstants.gridItemSize))]) {
                        ZStack {
                            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                                .fill()
                                .foregroundColor(.blue)
                            shape
                            VStack {
//                                Text("FlashCard erstellen")
//                                    .bold()
                                Image(systemName: "plus")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(50)
                            }
                        }
                        .aspectRatio(1, contentMode: .fit)
                        .onTapGesture {
                            viewModel.playlistID = playlistID
                            viewModel.addFlashCard()
                        }
                        ForEach(viewModel.playlists[playlistID].flashCards, id: \.id) { flashCard in
                            FlashCardView(flashCard: flashCard.self)
                                .aspectRatio(1, contentMode: .fit)
                                .onTapGesture {
                                    viewModel.playlistID = playlistID
                                    viewModel.flashCardID = flashCard.id
                                    viewModel.flipFlashCard()
                                }
                        }
                    }
                }
                .padding()
            }
        }
    }
}
