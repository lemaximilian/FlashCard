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
    @State var selectedFlashCard: UUID
    @State var alertShown = false
    let alertTitle = "Achtung"
    let alertMessage = "Möchten Sie diese FlashCard wirklich löschen?"
    let alertButtonTextConfirm = "Bestätigen"
    let alertButtonTextCancel = "Abbrechen"
    @State var text: String = ""
    
    var body: some View {
        TabView(selection: $selectedFlashCard) {
            ForEach(viewModel.playlists[viewModel.playlistIndex].flashCards.reversed()) { flashCard in // Lernkarte innerhalb der Playlist
                VStack {
                    Button(action: {
                        viewModel.flashCardIndex = viewModel.getFlashCardIndex(selectedFlashCard)!
                        withAnimation {
//                                viewModel.editFlashCard()
                            viewModel.flipFlashCard()
                        }
                    }) {
                        Image(systemName: "arrow.left.arrow.right")
                            .foregroundColor(.blue)
                    }
                    FlashCardView(flashCard: flashCard.self)
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
                        .tag(flashCard.id)
                    Button(action: {
                        viewModel.flashCardIndex = viewModel.getFlashCardIndex(flashCard.id)!
                        if viewModel.flashCards[viewModel.flashCardIndex].isFlipped == false {
                            text = viewModel.flashCards[viewModel.flashCardIndex].frontContent
                        } else {
                            text = viewModel.flashCards[viewModel.flashCardIndex].backContent
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
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
//        .onTapGesture { hideKeyboardAndSave() }
        .toolbar {
            HStack {
                Button(action: {
                    
                }) {
                    Image(systemName: "pencil")
                }
                .foregroundColor(.blue)
                Button(action: {
                    alertShown.toggle()
                }) {
                    Image(systemName: "trash")
                }
                .alert(Text(alertTitle), isPresented: $alertShown, actions: { // Alert bei fehlendem Playlistnamen
                    Button(alertButtonTextCancel) { }
                    Button(alertButtonTextConfirm) {
                        viewModel.flashCardIndex = viewModel.getFlashCardIndex(selectedFlashCard)!
                        viewModel.deleteFlashCard()
                    }
                }, message: {
                    Text(alertMessage)
                })
                .foregroundColor(.red)
            }
        }
    }
    
//    func hideKeyboardAndSave() {
//            save()
//    }
//
//    func save() {
//        viewModel.flashCards[viewModel.flashCardIndex].frontContent = text
//    }
}

