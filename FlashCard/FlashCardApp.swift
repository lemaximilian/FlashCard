//
//  FlashCardApp.swift
//  FlashCard
//
//  Created by Maximilian Le on 05.08.22.
//

import SwiftUI

@main
struct FlashCardApp: App {
    private let flashCard = FlashCardViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: flashCard)
        }
    }
}
