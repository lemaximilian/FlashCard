//
//  AddFlashCardView.swift
//  FlashCard
//
//  Created by Maximilian Le on 07.08.22.
//

import SwiftUI

struct AddFlashCardView: View { // Erste Karte im Raster, zum Hinzufügen neuer Lernkarten
    @EnvironmentObject var viewModel: FlashCardViewModel
    var playlistID: Int
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius) // Karte zum Erstellen
                .fill()
                .foregroundColor(.blue)
            shape
            VStack {
                Image(systemName: "plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(50)
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onTapGesture {
            viewModel.playlistID = playlistID
            withAnimation {
                viewModel.addFlashCard()
            }
        }
    }
}

