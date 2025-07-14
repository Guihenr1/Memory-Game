//
//  MemorizeGame.swift
//  Memory-Game
//
//  Created by Guilherme Pompilio on 09/07/2025.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    
    init(numberOfPairOfCards: Int, contentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairOfCards) {
            let content = contentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    mutating func choose (_ card: Card) {
        if let chooseIndex = cards.firstIndex (where: { $0.id == card.id }) {
            if !cards[chooseIndex].isFaceUp, !cards[chooseIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chooseIndex].content == cards[potentialMatchIndex].content {
                        cards[chooseIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chooseIndex
                }
                cards[chooseIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
    }
}

extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}
