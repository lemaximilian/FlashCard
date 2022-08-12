//
//  PlaylistView.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

struct ListView: View { // View, die die erstellten Playlisten anzeigt
    @EnvironmentObject var viewModel: FlashCardViewModel
    
    var body: some View {
        listView
    }
    
    @ViewBuilder
    var listView: some View {
        if viewModel.playlists.count == 0 { // wenn keine Playlist vorhanden --> Text
            Text("Es ist keine Playlist vorhanden.")
        } else { // wenn mind. eine Playlist vorhanden -> Anzeige als Liste
            List {
                ForEach(viewModel.playlists) { playlist in
                    NavigationLink(destination: PlaylistView(playlistID: playlist.id, playlistName: playlist.name)) {
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

