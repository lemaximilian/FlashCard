//
//  FlashCardModel.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import Foundation

struct FlashCardModel {
    var alertShown = false
    var playlists: Array<Playlist> = [] // Playlists des Users
    
    mutating func addPlaylist(_ name: String) { // fügt eine Playlist zum Array playlists hinzu
        let newPlaylist = Playlist(name: name)
        playlists.append(newPlaylist)
    }
    
    mutating func deletePlaylist(_ id: UUID) { // löscht die Playlist
        if let index = playlists.firstIndex(where: { $0.id == id }) {
            print(index)
            playlists.remove(at: index)
        }
    }
    
    struct Playlist: Identifiable {
        let id = UUID()
        var name: String // Name der Playlist
        var flashCards: Array<FlashCard> = [] // Lernkarten innerhalb einer Playlist
        
        mutating func addFlashCard() { // fügt eine Lernkarte zum Array flashCards hinzu
            let newFlashCard = FlashCard()
            flashCards.append(newFlashCard)
        }
        
        mutating func deleteFlashCard(_ id: UUID) { // löscht die Playlist
            if let index = flashCards.firstIndex(where: { $0.id == id }) {
                print(index)
                flashCards.remove(at: index)
            } else {
                print(index)
            }
        }
        
//        mutating func editPlaylistName(newName: String) {
//
//        }

    }
        
    struct FlashCard: Identifiable {
        let id = UUID()
        var frontContent: String = ""
        var backContent: String = ""
        var isFlipped: Bool = false // wenn false -> Vorderseite, wenn true -> Rückseite
        var editMode: Bool = false
        
        mutating func flipFlashCard() { // dreht die Lernkarte um
            isFlipped.toggle()
        }
        
//        mutating func editFlashCard() { // ändert den Inhalt der Lernkarte
//            editMode.toggle()
//        }
        
    }
    
}
