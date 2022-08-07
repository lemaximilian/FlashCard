//
//  AddPlaylistView.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

struct AddPlaylistView: View { // View zum Hinzufügen von Playlisten
    @EnvironmentObject var viewModel: FlashCardViewModel
    @Binding var tab: Tab
    @State var userInput: String = ""
    var alertTitle: String = "Ungültiger Name"
    var alertMessage: String = "Bitte geben Sie für Ihre Playlist einen Namen ein."
    var alertButtonText: String = "Bestätigen"
    
    var body: some View {
        VStack {
            Spacer()
            Text("Neue Playlist erstellen")
                .font(.title2)
                .bold()
            TextField("Name der Playlist", text: $userInput) // Textfeld für die Benutzereingabe
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Text("Geben Sie Ihrer neuen Playlist einen Namen.")
                .font(.footnote)
            Button(action: { // Button zur Erstellung
                if userInput == "" {
                    viewModel.alertShown.toggle() // wenn Textfeld leer -> Anzeige Alert
                } else {
                    viewModel.addPlaylist(userInput)
                    tab = .playlists // wenn Textfeld nicht leer --> Playlist hinzufügen und zur ListView wechseln
                }
            }) {
                Text("Playlist erstellen")
            }
            .alert(Text(alertTitle), isPresented: $viewModel.alertShown, actions: { // Alert bei fehlendem Playlistnamen
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
