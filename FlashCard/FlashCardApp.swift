//
//  FlashCardApp.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

@main
struct FlashCardApp: App {
    @StateObject private var flashCard = FlashCardViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(flashCard)
        }
    }
}
