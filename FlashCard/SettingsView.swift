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
                NavigationLink(destination: UserInterfaceView(columns: 1)) {
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

struct UserInterfaceView: View {
    @State var columns: Int
    
    var body: some View {
        VStack {
            HStack {
                Text("Anzahl der Spalten: ")
                    .bold()
                Stepper("\(columns)", value: $columns, in: 1...3)
            }
            .padding()
            Spacer()
        }
    }
}
