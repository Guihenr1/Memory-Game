//
//  CardView.swift
//  Memory-Game
//
//  Created by Guilherme Pompilio on 17/07/2025.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    
    let card: Card
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)

            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: Constants.lineWidth)
                Circle()
                    .opacity(Constants.pie.opacity)
                    .overlay(
                        Text(card.content).font(.system(size: Constants.fontSize.largest)).minimumScaleFactor(Constants.fontSize.scaleFactor)
                            .multilineTextAlignment(.center)
                            .aspectRatio(1, contentMode: .fit)
                            .padding(Constants.pie.inset)
                    )
            }
                .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct fontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor: CGFloat = smallest / largest
        }
        struct pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
}

#Preview {
    VStack {
        HStack {
            CardView(MemoryGame.Card(isFaceUp: true, content: "🐗", id: "Test"))
            CardView(MemoryGame.Card(isFaceUp: true, content: "🐗", id: "Test"))
        }
        HStack {
            CardView(MemoryGame.Card(isFaceUp: true, content: "🌚", id: "Test"))
            CardView(MemoryGame.Card(isFaceUp: true, content: "🌚", id: "Test"))
        }
    }
    .padding()
    .foregroundStyle(.orange)

}
