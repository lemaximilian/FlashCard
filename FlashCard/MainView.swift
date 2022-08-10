//
//  MainView.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

struct MainView: View { // Hauptansicht (TabView)
    @AppStorage("FirstStart") var welcomeMessageShown = true // wenn true -> Willkommensnachricht wird angezeigt, wenn false -> wird nicht mehr angezeigt
    @StateObject var viewModel: FlashCardViewModel
    @State var selection: Tab = .playlists // Variable zur Auswahl der View
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(.stack)
            .tabItem {
                Image(systemName: "square.stack")
                Text("Playlists")
            }
            .tag(Tab.playlists)
            AddPlaylistView(tab: $selection)
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Neue Playlist")
                }
                .tag(Tab.newPlaylists)
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Einstellungen")
                }
                .tag(Tab.settings)
        }
        .environmentObject(viewModel)
        .sheet(isPresented: $welcomeMessageShown) {
            WelcomeView(welcomeMessageShown: $welcomeMessageShown).padding().environmentObject(viewModel)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: FlashCardViewModel()).preferredColorScheme(.light)
    }
}
