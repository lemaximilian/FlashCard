//
//  SettingsView.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

struct SettingsView: View { // Einstellungs-View
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: advancedSettingsView()) {
                    HStack {
                        Image(systemName: "person")
                        Text("Kontoeinstellungen")
                    }
                }
                NavigationLink(destination: advancedSettingsView()) {
                    HStack {
                        Image(systemName: "iphone")
                        Text("Benutzeroberfläche")
                    }
                }
                NavigationLink(destination: advancedSettingsView()) {
                    HStack {
                        Image(systemName: "speaker")
                        Text("Sprachausgabe")
                    }
                }
            }
            .navigationTitle("Einstellungen")
        }
    }
}

struct advancedSettingsView: View {
    var body: some View {
        Text("Irgendwelche Einstellungen...")
    }
}
