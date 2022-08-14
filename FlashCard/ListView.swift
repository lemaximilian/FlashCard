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
        if viewModel.playlists.isEmpty { // wenn keine Playlist vorhanden --> Text
            Text("Es ist keine Playlist vorhanden.")
        } else { // wenn mind. eine Playlist vorhanden -> Anzeige als Liste
            List {
                ForEach(viewModel.playlists) { playlist in
                    NavigationLink(destination: PlaylistView(playlist: playlist)) {
                        if playlist.count == 0 {
                            Text(playlist.name)
                        } else {
                            Text(playlist.name + "(\(playlist.count))")
                        }
                    }
                }
            }
            .navigationTitle("Playlists")
        }
    }
}

