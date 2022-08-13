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
    var flashCard: FlashCardModel.FlashCard
    var playlist: FlashCardModel.Playlist
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(viewModel.flashCards.reversed()) { flashCard in // Lernkarte innerhalb der Playlist
                VStack {
                    FlipButton(flashCardID: flashCard.id)
                    FlashCardView(flashCard: flashCard)
                        .aspectRatio(1, contentMode: .fit)
                        .padding()
//                        .onTapGesture {
//                            viewModel.playlistIndex = playlistIndex
//                            viewModel.flashCardIndex = viewModel.getFlashCardIndex(flashCard.id)!
//                            withAnimation {
//                                viewModel.editFlashCard()
//                                viewModel.flipFlashCard()
//                            }
//                        }
                    VoiceOutputButton(flashCard: flashCard)
                }
                .tag(flashCard.id)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .toolbar {
            DeleteButton(flashCard: flashCard, playlist: playlist)
        }
    }
}


struct FlipButton: View {
    @EnvironmentObject var viewModel: FlashCardViewModel
    var flashCardID: UUID
    
    var body: some View {
        Button(action: {
            withAnimation {
                viewModel.flipFlashCard(flashCardID)
            }
        }) {
            Image(systemName: "arrow.left.arrow.right")
                .foregroundColor(.blue)
        }
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
    var flashCard: FlashCardModel.FlashCard
    var playlist: FlashCardModel.Playlist
    let alertTitle = "Achtung"
    let alertMessage = "Möchten Sie diese FlashCard wirklich löschen?"
    let alertButtonTextConfirm = "Bestätigen"
    let alertButtonTextCancel = "Abbrechen"
    
    var body: some View {
        Button(action: {
            alertShown.toggle()
        }) {
            Image(systemName: "trash")
        }
        .alert(Text(alertTitle), isPresented: $alertShown, actions: { // Alert bei fehlendem Playlistnamen
            Button(alertButtonTextCancel) { }
            Button(alertButtonTextConfirm) {
                print("deleted")
                withAnimation {
                    viewModel.deleteFlashCard(flashCard.id)
                }
            }
        }, message: {
            Text(alertMessage)
        })
        .foregroundColor(.red)
    }
}
