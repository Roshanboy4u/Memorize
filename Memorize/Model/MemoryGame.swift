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
    
    mutating func chooseCard(card: Card) {
        print("Choose card: \(card)")
        let choosedIndex = self.index(of: card)
        self.cards[choosedIndex].isFaceUp = !self.cards[choosedIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0 // TODO: Bogus
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
