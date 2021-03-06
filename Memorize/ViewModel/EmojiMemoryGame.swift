//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Roshan sah on 06/06/20.
//  Copyright © 2020 Roshan sah. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻","🎃", "🧟‍♂️"]
        return MemoryGame<String>(numbersOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
        
    }
    
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}
