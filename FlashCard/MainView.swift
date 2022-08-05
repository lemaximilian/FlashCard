//
//  MainView.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

enum Tab {
    case playlists
    case newPlaylists
    case settings
}

struct MainView: View {
    @StateObject var viewModel: FlashCardViewModel
    @AppStorage("FirstStart") var welcomeMessageShown = true
    @State var selection: Tab = .playlists
    
    var body: some View {
        TabView(selection: $selection) {
            ListView()
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
            welcomeView.padding()
        }
    }
    
    var welcomeView: some View {
        VStack {
            Spacer()
            Text("Willkommen bei FlashCard!")
                .font(.largeTitle)
                .bold()
                .padding()
            Text("Erstellen Sie mit FlashCard grandiose Lernkarten um ihr Lernerlebnis zu verbessern! Legen Sie einfach eine neue Playlist an und fügen Sie Lernkarten hinzu.")
                .font(.subheadline)
            Spacer()
            Button(action: {
                welcomeMessageShown = false
            }) {
                Text("Verstanden!")
                    .padding(10)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.regular)
            .padding()
            .interactiveDismissDisabled()
        }
    }
}

struct DrawingConstants {
    static let cornerRadius: CGFloat = 20
    static let fontScale: CGFloat = 0.3
    static let gridItemSize: CGFloat = 100
    static let minimumScaleFactor: CGFloat = 0.4
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: FlashCardViewModel())
    }
}
