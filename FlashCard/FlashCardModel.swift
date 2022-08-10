//
//  FlashCardModel.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import Foundation
import SwiftUI

struct FlashCardModel {
    @AppStorage("FirstStart") var welcomeMessageShown = true // wenn true -> Willkommensnachricht wird angezeigt, wenn false -> wird nicht mehr angezeigt
    var alertShown = false
    var playlists: Array<Playlist> = [] // Playlists des Users
    
    mutating func addPlaylist(_ name: String) { // fügt eine Playlist zum Array playlists hinzu
        let newPlaylist = Playlist(name: name)
        playlists.append(newPlaylist)
    }
    
    mutating func deletePlaylist(_ playlistIndex: Int) { // löscht die Playlist
        playlists.remove(at: playlistIndex)
    }
    
    func getPlaylistIndex(_ id: UUID) -> Int? {
        playlists.firstIndex { $0.id == id }
    }
    
    struct Playlist: Identifiable {
        let id = UUID()
        var name: String // Name der Playlist
        var flashCards: Array<FlashCard> = [] // Lernkarten innerhalb einer Playlist
        
        mutating func addFlashCard() { // fügt eine Lernkarte zum Array flashCards hinzu
            let newFlashCard = FlashCard()
            flashCards.append(newFlashCard)
        }
        
        mutating func deleteFlashCard(_ flashCardIndex: Int) { // löscht die Lernkarte
            flashCards.remove(at: flashCardIndex)
        }
        
        func getFlashCardIndex(_ id: UUID) -> Int? {
            flashCards.firstIndex { $0.id == id }
        }
        
        mutating func editPlaylistName(newName: String) {
            
        }

    }
        
    struct FlashCard: Identifiable {
        let id = UUID()
        var frontContent: String = "vorne"
        var backContent: String = "hinten"
        var isFlipped: Bool = false // wenn false -> Vorderseite, wenn true -> Rückseite
        var editMode: Bool = false
        
        mutating func flipFlashCard() { // dreht die Lernkarte um
            isFlipped.toggle()
        }
        
        mutating func editFlashCard() { // ändert den Inhalt der Lernkarte
            editMode.toggle()
        }
        
    }
    
}
