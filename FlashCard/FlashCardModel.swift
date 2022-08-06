//
//  FlashCardModel.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import Foundation

struct FlashCardModel {
    var playlists: Array<Playlist> = [] // Playlists des Users
    
    mutating func addPlaylist(_ name: String) { // fügt eine Playlist zum Array playlists hinzu
        let newPlaylistID = playlists.count
        let newPlaylist = Playlist(id: newPlaylistID, name: name)
        playlists.append(newPlaylist)
    }
    
    mutating func deletePlaylist(_ playlist: Playlist) { // löscht die Playlist
        playlists.removeAll { $0.id == playlist.id }
    }
    
    struct Playlist: Identifiable {
        let id: Int
        var name: String // Name der Playlist
        var flashCards: Array<FlashCard> = [] // Lernkarten innerhalb einer Playlist
        
        mutating func addFlashCard() { // fügt eine Lernkarte zum Array flashCards hinzu
            let newFlashCardID = flashCards.count
            let newFlashCard = FlashCard(newFlashCardID)
            flashCards.append(newFlashCard)
        }
        
        mutating func deleteFlashCard(_ flashCard: FlashCard) { // löscht die Lernkarte
            flashCards.removeAll { $0.id == flashCard.id}
        }
        
        
        mutating func editPlaylistName(newName: String) {
            
        }

    }
        
    struct FlashCard: Identifiable {
        let id: Int
        var frontContent: String = "front"
        var backContent: String = "back"
        var isFlipped: Bool = false // wenn false -> Vorderseite, wenn true -> Rückseite
        
        init(_ id: Int) {
            self.id = id
        }
        
        mutating func flipFlashCard() { // dreht die Lernkarte um
            isFlipped.toggle()
        }
        
        mutating func editFlashCard(editContent: String) { // ändert den Inhalt der Lernkarte
            if isFlipped == false {
                frontContent = editContent
            } else {
                backContent = editContent
            }
        }
        
    }
    
}
