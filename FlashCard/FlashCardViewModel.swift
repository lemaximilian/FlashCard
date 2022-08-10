//
//  FlashCardViewModel.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

class FlashCardViewModel: ObservableObject {
    typealias Playlist = FlashCardModel.Playlist
    typealias FlashCard = FlashCardModel.FlashCard
    
    @Published private var model = FlashCardModel() // Initialisierung Model
    var playlistIndex = 0
    var flashCardIndex = 0
    
//    var welcomeMessageShown: Bool {
//        get { model.welcomeMessageShown }
//        set { model.welcomeMessageShown = newValue }
//    }
    
    var alertShown: Bool {
        get { model.alertShown }
        set { model.alertShown = newValue }
    }
    
    var playlists: Array<Playlist> {
        get { model.playlists }
        set { model.playlists = newValue }
    }
    
    var flashCards: Array<FlashCard> {
        get { model.playlists[playlistIndex].flashCards }
        set { model.playlists[playlistIndex].flashCards = newValue }
    }
    
    func addPlaylist(_ name: String) {
        model.addPlaylist(name)
    }
    
    func deletePlaylist() {
        model.deletePlaylist(playlistIndex)
    }
    
    func getPlaylistIndex(_ id: UUID) -> Int? {
        model.getPlaylistIndex(id)
    }
    
    func addFlashCard() {
        playlists[playlistIndex].addFlashCard()
    }
    
    func flipFlashCard() {
        flashCards[flashCardIndex].flipFlashCard()
    }
    
    func editFlashCard() {
        flashCards[flashCardIndex].editFlashCard()
    }
    
    func deleteFlashCard() {
        playlists[playlistIndex].deleteFlashCard(flashCardIndex)
    }
    
    func getFlashCardIndex(_ id: UUID) -> Int? {
        playlists[playlistIndex].getFlashCardIndex(id)
    }
}

