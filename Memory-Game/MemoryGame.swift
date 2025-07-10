//
//  MemorizeGame.swift
//  Memory-Game
//
//  Created by Guilherme Pompilio on 09/07/2025.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    func choose (card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
