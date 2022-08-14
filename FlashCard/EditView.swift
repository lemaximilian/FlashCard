//
//  EditView.swift
//  FlashCard
//
//  Created by Maximilian Le on 14.08.22.
//

import SwiftUI

struct EditView: View {
    @EnvironmentObject var viewModel: FlashCardViewModel
    @State var flashCard: FlashCardModel.FlashCard
    var playlist: FlashCardModel.Playlist
    @FocusState private var focusedField: Bool
    
    var body: some View {
        if flashCard.isFlipped == false {
            TextEditor(text: $flashCard.frontContent)
                .focused($focusedField)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        focusedField = true
                    }
                }
                .onChange(of: flashCard.frontContent, perform: { value in
                    viewModel.editFlashCard(playlistID: playlist.id, flashCardID: flashCard.id, newContent: value)
                })
                .navigationTitle("Vorderseite")
                .padding()
        } else {
            TextEditor(text: $flashCard.backContent)
                .focused($focusedField)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        focusedField = true
                    }
                }
                .onChange(of: flashCard.backContent, perform: { value in
                    viewModel.editFlashCard(playlistID: playlist.id, flashCardID: flashCard.id, newContent: value)
                })
                .navigationTitle("Rückseite")
                .padding()
        }
    }
}

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}
