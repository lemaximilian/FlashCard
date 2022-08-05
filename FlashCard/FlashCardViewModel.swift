//
//  FlashCardViewModel.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

class FlashCardViewModel: ObservableObject {
    typealias Playlist = FlashCardModel.Playlist
    typealias FlashCard = FlashCardModel.Playlist.FlashCard
    
    @Published private var model = FlashCardModel()
    var playlistID = 0
    var flashCardID = 0
    
    var playlists: Array<Playlist> {
        get { model.playlists }
        set { model.playlists = newValue }
    }
    
    var flashCards: Array<FlashCard> {
        get { model.playlists[playlistID].flashCards }
        set { model.playlists[playlistID].flashCards = newValue }
    }
    
    func addPlaylist(_ name: String) {
        model.addPlaylist(name)
    }
    
    func addFlashCard() {
        playlists[playlistID].addFlashCard()
    }
    
    func flipFlashCard() {
        flashCards[flashCardID].flipFlashCard()
    }
}

