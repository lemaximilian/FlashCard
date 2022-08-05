//
//  FlashCardModel.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import Foundation

struct FlashCardModel {
    var playlists: Array<Playlist> = []
    
    mutating func addPlaylist(_ name: String) {
        let newPlaylistID = playlists.count
        let newPlaylist = Playlist(id: newPlaylistID, name: name)
        playlists.append(newPlaylist)
    }
    
    mutating func deletePlaylist(_ playlist: Playlist) {
        playlists.removeAll { $0.id == playlist.id }
    }
    
    struct Playlist: Identifiable {
        let id: Int
        var name: String
        var flashCards: Array<FlashCard> = []
        
        mutating func addFlashCard() {
            let newFlashCardID = flashCards.count
            let newFlashCard = FlashCard(newFlashCardID)
            flashCards.append(newFlashCard)
        }
        
        mutating func deleteFlashCard(_ flashCard: FlashCard) {
            flashCards.removeAll { $0.id == flashCard.id}
        }
        
        
        mutating func editPlaylistName(newName: String) {
            
        }
        
        struct FlashCard: Identifiable {
            let id: Int
            var frontContent: String = "front"
            var backContent: String = "back"
            var isFlipped: Bool = false
            
            init(_ id: Int) {
                self.id = id
            }
            
            mutating func flipFlashCard() {
                isFlipped.toggle()
            }
            
            mutating func editFlashCard(editContent: String) {
                if isFlipped == false {
                    frontContent = editContent
                } else {
                    backContent = editContent
                }
            }
        }
    }
}
