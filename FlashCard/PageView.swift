//
//  PageView.swift
//  FlashCard
//
//  Created by Maximilian Le on 07.08.22.
//

import SwiftUI
import AVFoundation
import NaturalLanguage

struct PageView: View {
    @EnvironmentObject var viewModel: FlashCardViewModel
    @State var selection: UUID
//    var flashCard: FlashCardModel.FlashCard
    var playlist: FlashCardModel.Playlist
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(playlist.flashCards.reversed()) { flashCard in // Lernkarte innerhalb der Playlist
                VStack {
                    FlashCardView(flashCard: flashCard)
                        .aspectRatio(1, contentMode: .fit)
                        .padding()
                        .onTapGesture {
                            withAnimation {
                                viewModel.flipFlashCard(playlistID: playlist.id, flashCardID: flashCard.id)
                            }
                        }
                    VoiceOutputButton(flashCard: flashCard)
                }
                .tag(flashCard.id)
                .toolbar {
                    HStack {
                        NavigationLink(destination: EditView(flashCard: flashCard, playlist: playlist)) {
                            Image(systemName: "pencil")
                        }
                        DeleteButton(flashCardID: selection, playlist: playlist)
                    }
                }
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        
    }
}

struct VoiceOutputButton: View {
    @EnvironmentObject var viewModel: FlashCardViewModel
    @State var text = ""
    var flashCard: FlashCardModel.FlashCard
    
    var body: some View {
        Button(action: {
            if flashCard.isFlipped == false {
                text = flashCard.frontContent
            } else {
                text = flashCard.backContent
            }
            if let language = NSLinguisticTagger.dominantLanguage(for: text) {
                let ausgabe = AVSpeechUtterance(string: "\(text)")
                ausgabe.voice = AVSpeechSynthesisVoice(language: language)
                ausgabe.rate = 0.5 //Tempo der Aussprache
                
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(ausgabe)
            }
        }) {
            Image(systemName: "speaker.wave.2")
                .foregroundColor(.blue)
        }
    }
}

struct DeleteButton: View {
    @EnvironmentObject var viewModel: FlashCardViewModel
    @State var alertShown = false
    var flashCardID: UUID
    var playlist: FlashCardModel.Playlist
    
    var body: some View {
        Button(action: {
            alertShown.toggle()
        }) {
            Image(systemName: "trash")
        }
        .alert(Text("Achtung"), isPresented: $alertShown, actions: { // Alert bei fehlendem Playlistnamen
            Button("Abbrechen") { }
            Button("Bestätigen") {
                withAnimation {
                    viewModel.deleteFlashCard(playlistID: playlist.id, flashCardID: flashCardID)
                }
            }
        }, message: {
            Text("Möchten Sie diese FlashCard wirklich löschen?")
        })
        .foregroundColor(.red)
    }
}
