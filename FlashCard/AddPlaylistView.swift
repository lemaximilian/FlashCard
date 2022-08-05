//
//  AddPlaylistView.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

struct AddPlaylistView: View {
    @EnvironmentObject var viewModel: FlashCardViewModel
    @Binding var tab: Tab
    @State var userInput: String = ""
    @State var alertShown: Bool = false
    @State var nextView: Bool = false
    var alertTitle: String = "Ungültiger Name"
    var alertMessage: String = "Bitte geben Sie für Ihre Playlist einen Namen ein."
    var alertButtonText: String = "Bestätigen"
    
    var body: some View {
        VStack {
            Spacer()
            Text("Neue Playlist erstellen")
                .font(.title2)
                .bold()
            TextField("Name der Playlist", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Text("Geben Sie Ihrer neuen Playlist einen Namen.")
                .font(.footnote)
            Button(action: {
                if userInput == "" {
                    alertShown = true
                } else {
                    viewModel.addPlaylist(userInput)
                    tab = .playlists
                }
            }) {
                Text("Playlist erstellen")
            }
            .alert(Text(alertTitle), isPresented: $alertShown, actions: {
                Button(alertButtonText) { }
            }, message: {
                Text(alertMessage)
            })
            .buttonStyle(.borderedProminent)
            .controlSize(.regular)
            .padding()
            Spacer()
        }
        .padding()
    }
}
