//
//  PlaylistView.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var viewModel: FlashCardViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.playlists.count == 0 {
                Text("Es ist keine Playlist vorhanden.")
            } else {
                List {
                    ForEach(viewModel.playlists, id: \.id) { playlist in
                        NavigationLink(destination: PlaylistView(playlistName: playlist.name, playlistID: playlist.id)) {
                            Text(playlist.name)
                        }
//                        .simultaneousGesture(TapGesture().onEnded {
//                            viewModel.playlistID = playlist.id
//                        })
                    }
                }
                .navigationTitle("Playlists")
            }
        }
    }
}

