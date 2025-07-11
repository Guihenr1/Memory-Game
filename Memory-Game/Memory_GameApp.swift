//
//  Memory_GameApp.swift
//  Memory-Game
//
//  Created by Guilherme Pompilio on 07/07/2025.
//

import SwiftUI

@main
struct Memory_GameApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
