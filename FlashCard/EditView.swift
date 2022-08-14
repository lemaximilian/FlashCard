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
                .navigationTitle("Rückseite")
                .padding()
        }
    }
}
