//
//  MemoryGame.swift
//  Memorize
//
//  Created by Roshan sah on 06/06/20.
//  Copyright © 2020 Roshan sah. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            let facesUpIndices = cards.indices.filter { cards[$0].isFaceUp }
            return facesUpIndices.onlyOne
        } set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init(numbersOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        self.cards = Array<Card>()
        for pairIndex in 0..<numbersOfPairsOfCards {
            let cardContent = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: cardContent))
            cards.append(Card(id: pairIndex * 2 + 1, content: cardContent))
        }
    }
    
    mutating func choose(card: Card) {
        print("Choose card: \(card)")
        if let choosedIndex = cards.firstIndex(ofMatchingElement: card),
            !cards[choosedIndex].isFaceUp,
            !cards[choosedIndex].isMatched {
            
            if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
                if cards[choosedIndex].content == cards[potentialMatchIndex].content {
                    cards[choosedIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[choosedIndex].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = choosedIndex
            }
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
