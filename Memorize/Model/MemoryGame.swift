//
//  MemoryGame.swift
//  Memorize
//
//  Created by Roshan sah on 06/06/20.
//  Copyright © 2020 Roshan sah. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numbersOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        self.cards = Array<Card>()
        for pairIndex in 0..<numbersOfPairsOfCards {
            let cardContent = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, isFaceUp: true, isMatched: false, content: cardContent))
            cards.append(Card(id: pairIndex * 2 + 1, isFaceUp: true, isMatched: false, content: cardContent))
        }
    }
    
    func chooseCard(card: Card) {
        print("Choose card: \(card)")
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
