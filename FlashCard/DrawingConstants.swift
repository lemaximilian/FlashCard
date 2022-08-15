//
//  DrawingConstants.swift
//  FlashCard
//
//  Created by Maximilian Le on 07.08.22.
//

import SwiftUI

struct DrawingConstants { // Konstanten für ViewModifier etc.
    static let cornerRadius: CGFloat = 20
    static let fontScale: CGFloat = 0.3
    static let gridItemSize: CGFloat = 150 // 200 = 1, 150 = 2, 100 = 3
    static let minimumScaleFactor: CGFloat = 0.4
}

struct ExecuteCode : View {
    init( _ codeToExec: () -> () ) {
        codeToExec()
    }
    
    var body: some View {
        return EmptyView()
    }
}
