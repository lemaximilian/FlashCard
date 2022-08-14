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
    
    var alertShown: Bool {
        get { model.alertShown }
        set { model.alertShown = newValue }
    }
    
    var playlists: Array<Playlist> {
        get { model.playlists }
        set { model.playlists = newValue }
    }
    
//    var flashCards: Array<FlashCard> {
//        get {
//            var array: Array<FlashCard> = []
//
//            if let index = playlists.firstIndex(where: { $0.id == playlistID }) {
//                array = model.playlists[index].flashCards
//            }
//            return array
//        }
//        set {
//            if let index = playlists.firstIndex(where: { $0.id == playlistID }) {
//                model.playlists[index].flashCards = newValue
//            }
//        }
//    }
    
    func addPlaylist(_ name: String) {
        model.addPlaylist(name)
    }
    
    func deletePlaylist(_ id: UUID) {
        model.deletePlaylist(id)
    }
    
    func addFlashCard(_ id: UUID) {
        if let index = playlists.firstIndex(where: { $0.id == id }) {
            playlists[index].addFlashCard()
        }
    }
    
    func deleteFlashCard(playlistID : UUID, flashCardID : UUID) {
        if let index = playlists.firstIndex(where: { $0.id == playlistID }) {
            playlists[index].deleteFlashCard(flashCardID)
        }
        
    }
    
    func flipFlashCard(playlistID : UUID, flashCardID : UUID) {
        if let playlistIndex = playlists.firstIndex(where: { $0.id == playlistID }) {
            if let flashCardIndex = playlists[playlistIndex].flashCards.firstIndex(where: { $0.id == flashCardID} ) {
                playlists[playlistIndex].flashCards[flashCardIndex].flipFlashCard()
            }
        }
    }
    
    func editFlashCard(playlistID : UUID, flashCardID : UUID, newContent: String) {
        if let playlistIndex = playlists.firstIndex(where: { $0.id == playlistID }) {
            if let flashCardIndex = playlists[playlistIndex].flashCards.firstIndex(where: { $0.id == flashCardID} ) {
                playlists[playlistIndex].flashCards[flashCardIndex].editFlashCard(newContent)
            }
        }
    }

}

